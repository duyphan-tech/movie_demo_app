import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/base_movie_grid_item.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/base_movie_list_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class FavoriteMoviesScreen extends StatelessWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseMovieListScreen(
      title: context.l10n.favoriteList,
      provider: favoriteMoviesListProvider,
      emptyMessage: context.l10n.emptyList,
      emptyIcon: Icons.favorite_border,
      childAspectRatio: 0.7,
      itemBuilder: (context, movie) {
        return BaseMovieGridItem(
          movie: movie,
          onTap: () {
            // context.push(RouterPath.details, extra: {'id': movie.id});
          },
          overlay: Container(
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(4),
            child: FavoriteButton(movieId: movie.id, color: Colors.red),
          ),
        );
      },
    );
  }
}
