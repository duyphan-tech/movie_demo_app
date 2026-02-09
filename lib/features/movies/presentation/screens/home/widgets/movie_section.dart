import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/movie_item.dart';

enum MovieCategory { nowPlaying, topRated, upcoming }

class MovieSection extends ConsumerWidget {
  final String title;
  final MovieCategory category;

  const MovieSection({super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesValue = ref.watch(
      homeProvider.select((asyncState) {
        return asyncState.whenData((state) {
          switch (category) {
            case MovieCategory.nowPlaying:
              return state.nowPlaying;
            case MovieCategory.topRated:
              return state.topRated;
            case MovieCategory.upcoming:
              return state.upcoming;
          }
        });
      }),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(context),
        SizedBox(
          height: 200,
          child: moviesValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red),
                  Text(
                    context.l10n.loadingError,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
            data: (movies) => _buildData(movies, context),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(context.l10n.seeAll, style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildData(List<Movie> movies, BuildContext context) {
    if (movies.isEmpty) return Center(child: Text(context.l10n.noMoviesFound));
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: movies.length,
      separatorBuilder: (_, __) => const SizedBox(width: 12),
      itemBuilder: (context, index) => MovieItem(movie: movies[index]),
    );
  }
}
