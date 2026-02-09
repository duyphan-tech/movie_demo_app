import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';

class RatedMovieItem extends StatelessWidget {
  final Movie movie;

  const RatedMovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // context.push(RouterPath.details, extra: {'id': movie.id});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomNetworkImage(
                    imageUrl: '${AppConstants.imageUrl500}${movie.posterPath}',
                    borderRadius: 12,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
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
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          Text(
            movie.title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
