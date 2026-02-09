import 'package:flutter/material.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class MovieInfoHeader extends StatelessWidget {
  final MovieDetail movie;

  const MovieInfoHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                movie.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            FavoriteButton(movieId: movie.id),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              '${movie.voteAverage.toStringAsFixed(1)}/10 IMDb',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
