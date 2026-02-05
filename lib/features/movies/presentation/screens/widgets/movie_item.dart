import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(RouterPath.details, extra: {'id': movie.id}),
      child: Stack(
        children: [
          SizedBox(
            width: 120,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    '${AppConstants.imageUrl200}${movie.posterPath}',
                    height: 160,
                    width: 120,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      height: 160,
                      color: Colors.grey[300],
                      child: const Icon(Icons.error),
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  movie.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: FavoriteButton(movieId: movie.id, color: Colors.red),
          ),
        ],
      ),
    );
  }
}
