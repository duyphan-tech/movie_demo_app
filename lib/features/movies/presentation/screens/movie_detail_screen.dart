import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_detail_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_detail_app_bar.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_genres_list.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_info_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_overview.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_reviews_section.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_stats_row.dart';

class MovieDetailScreen extends HookConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(movieDetailProvider(movieId));

    ref.listen(movieDetailProvider(movieId), (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: asyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                'Không thể tải thông tin phim',
                style: TextStyle(color: Colors.grey[600]),
              ),
              TextButton(
                onPressed: () => ref.refresh(movieDetailProvider(movieId)),
                child: const Text('Thử lại'),
              ),
            ],
          ),
        ),
        data: (movie) {
          return CustomScrollView(
            slivers: [
              MovieDetailAppBar(movie: movie),

              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieInfoHeader(movie: movie),
                      const SizedBox(height: 16),

                      MovieGenresList(genres: movie.genres),
                      const SizedBox(height: 16),

                      MovieStatsRow(movie: movie),
                      const SizedBox(height: 24),

                      MovieOverview(overview: movie.overview),
                      const SizedBox(height: 24),

                      MovieReviewsSection(movieId: movieId),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
