import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/details/${movie.id}'),
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 160,
                  width: 120,
                  child: CustomNetworkImage(
                    imageUrl: '${AppConstants.imageUrl200}${movie.posterPath}',
                    borderRadius: RadiusTokens.sm,
                    fit: BoxFit.cover,
                  ),
                ),
                context.gapXs,
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMd,
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: FavoriteButton(movieId: movie.id, color: context.brandPrimary),
          ),
        ],
      ),
    );
  }
}
