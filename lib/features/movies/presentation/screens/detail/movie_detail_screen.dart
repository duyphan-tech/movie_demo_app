import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/common/error_widget.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_detail_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/review_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_detail_app_bar.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_genres_list.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_info_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_overview.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_reviews_section.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/movie_stats_row.dart';

class MovieDetailScreen extends HookConsumerWidget {
  final int movieId;

  const MovieDetailScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(movieDetailProvider(movieId));

    final refreshData = useCallback(() async {
      await Future.wait([
        Future.delayed(const Duration(seconds: 1)),
        ref.refresh(movieDetailProvider(movieId).future),
        ref.refresh(reviewProvider(movieId).future),
        ref.refresh(movieAccountStateProvider(movieId).future),
        ref.read(favoritesProvider.notifier).checkFavoriteStatus(movieId),
      ]);
    }, [movieId]);

    useEffect(() {
      Future.microtask(() {
        ref.read(favoritesProvider.notifier).checkFavoriteStatus(movieId);
      });
      return null;
    }, const []);

    ref.listen(movieDetailProvider(movieId), (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.dataLoadError}: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: asyncValue.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => ErrorView(error: err, onRetry: refreshData),
        data: (movie) {
          return RefreshIndicator(
            onRefresh: refreshData,
            color: Colors.black,
            backgroundColor: Colors.white,
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              slivers: [
                MovieDetailAppBar(movie: movie, onRefresh: refreshData),

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
            ),
          );
        },
      ),
    );
  }
}
