import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class FavoriteMovieItem extends StatelessWidget {
  final Movie movie;

  const FavoriteMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: () {
        // context.push(RouterPath.details, extra: {'id': movie.id});
      },
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomNetworkImage(
                  imageUrl: '${AppConstants.imageUrl500}${movie.posterPath}',
                  borderRadius: 12,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.titleSmall,
                ),
              ),
            ],
          ),

          Positioned(
            top: 8,
            right: 8,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.scrim.withAlpha(128),
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: FavoriteButton(movieId: movie.id, color: colorScheme.primary),
            ),
          ),
        ],
      ),
    );
  }
}
