import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated/widgets/rated_movies_grid.dart';

class RatedMoviesScreen extends HookConsumerWidget {
  const RatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final ratedMoviesAsync = ref.watch(ratedMoviesProvider);

    final onRefresh = useCallback(() async {
      return ref.refresh(ratedMoviesProvider.future);
    }, []);

    // Show/hide EasyLoading based on loading state
    useEffect(() {
      if (ratedMoviesAsync.isLoading && !ratedMoviesAsync.hasValue) {
        EasyLoading.show(status: context.l10n.loading);
      } else {
        EasyLoading.dismiss();
      }
      return null;
    }, [ratedMoviesAsync.isLoading, ratedMoviesAsync.hasValue]);

    ref.listen(ratedMoviesProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        EasyLoading.showError(
          '${context.l10n.dataLoadError}: ${next.error}',
          duration: const Duration(seconds: 3),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.ratedMovies),
      ),
      body: ratedMoviesAsync.when(
        loading: () => const SizedBox.shrink(),

        error: (err, stack) => ErrorWidget(err),

        data: (movies) {
          if (movies.isEmpty) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_rounded,
                          size: 80,
                          color: colorScheme.onSurfaceVariant.withAlpha(51),
                        ),
                        const Gap(16),
                        Text(
                          context.l10n.noRatedMoviesMsg,
                          style: textTheme.bodyLarge?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: onRefresh,
            child: RatedMoviesGrid(movies: movies),
          );
        },
      ),
    );
  }
}
