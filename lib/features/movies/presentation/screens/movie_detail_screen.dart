import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_detail_app_bar.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_genres_list.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_info_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_overview.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_reviews_section.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_stats_row.dart';

import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/movie_detail.dart';
import '../providers/movie_detail_provider.dart';

class MovieDetailScreen extends ConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(movieDetailProvider(movieId));

    return Scaffold(
      backgroundColor: Colors.white,
      body: asyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Lỗi: $err')),
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
