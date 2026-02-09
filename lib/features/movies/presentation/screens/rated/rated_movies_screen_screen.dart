import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/base_movie_grid_item.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/base_movie_list_screen.dart';

class RatedMoviesScreen extends StatelessWidget {
  const RatedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMovieListScreen(
      title: context.l10n.ratedMovies,
      provider: ratedMoviesProvider,
      emptyMessage: context.l10n.noRatedMoviesMsg,
      emptyIcon: Icons.star_border_rounded,
      childAspectRatio: 0.65,
      itemBuilder: (context, movie) {
        return BaseMovieGridItem(
          movie: movie,
          onTap: () {
            // context.push(RouterPath.details, extra: {'id': movie.id});
          },
          overlay: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 12),
                const SizedBox(width: 4),
                Text(
                  '${movie.rating}',
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
