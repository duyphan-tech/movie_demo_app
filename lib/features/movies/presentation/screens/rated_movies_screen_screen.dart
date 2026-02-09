import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/rated_movies_grid.dart';

class RatedMoviesScreen extends HookConsumerWidget {
  const RatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ratedMoviesAsync = ref.watch(ratedMoviesProvider);

    ref.listen(ratedMoviesProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.dataLoadError}: ${next.error}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.ratedMovies,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ratedMoviesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 48,
                color: Colors.orange,
              ),
              const SizedBox(height: 8),
              Text(
                context.l10n.somethingWentWrong,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        data: (movies) {
          if (movies.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border_rounded,
                    size: 80,
                    color: Colors.grey[300],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    context.l10n.noRatedMoviesMsg,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }
          return RatedMoviesGrid(movies: movies);
        },
      ),
    );
  }
}
