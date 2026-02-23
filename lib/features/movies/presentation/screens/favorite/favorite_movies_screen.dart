import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/widgets/skeleton.dart';
import 'package:movie_demo_app/features/common/error_view.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/favorite/widgets/favorite_grid.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/empty_state.dart';

class FavoriteMoviesScreen extends HookConsumerWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteMoviesListProvider);

    final favoriteIds = ref.watch(favoritesProvider);

    ref.listen(favoriteMoviesListProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        EasyLoading.showError(
          '${context.l10n.error}: ${next.error}',
          duration: const Duration(seconds: 3),
        );
      }
    });

    final onRefresh = useCallback(() async {
      return ref.refresh(favoriteMoviesListProvider.future);
    }, []);


    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.favoriteList),
      ),
      body: favoritesAsync.when(
        loading: () => const Padding(
          padding: EdgeInsets.all(16),
          child: MovieGridSkeleton(itemCount: 8),
        ),

        error: (err, stack) => ErrorView(error: err, onRetry: onRefresh),

        data: (movies) {
          final activeMovies = movies
              .where((movie) => favoriteIds.contains(movie.id))
              .toList();
          if (activeMovies.isEmpty) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: const EmptyState(),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: onRefresh,
            child: FavoriteGrid(movies: activeMovies),
          );
        },
      ),
    );
  }
}
