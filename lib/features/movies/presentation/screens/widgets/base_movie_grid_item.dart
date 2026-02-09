import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';

class BaseMovieGridItem extends StatelessWidget {
  final Movie movie;
  final Widget? overlay;
  final VoidCallback? onTap;

  const BaseMovieGridItem({
    super.key,
    required this.movie,
    this.overlay,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                // Hình nền
                Positioned.fill(
                  child: CustomNetworkImage(
                    imageUrl: '${AppConstants.imageUrl500}${movie.posterPath}',
                    borderRadius: 12,
                    fit: BoxFit.cover,
                  ),
                ),
                if (overlay != null)
                  Positioned(top: 8, right: 8, child: overlay!),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              movie.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
