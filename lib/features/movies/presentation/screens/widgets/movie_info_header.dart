import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../providers/movie_provider.dart';

class MovieInfoHeader extends ConsumerWidget {
  final MovieDetail movie;

  const MovieInfoHeader({super.key, required this.movie});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesList = ref.watch(favoritesProvider);
    final isFavorite = favoritesList.any((element) => element.id == movie.id);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            IconButton(
              onPressed: () {
                ref.read(favoritesProvider.notifier).toggleFavorite(movie);
              },
              icon:Icon(
                isFavorite ? Icons.bookmark : Icons.bookmark_border,
                size: 28,
                color: isFavorite ? Colors.indigo : Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 20),
            const SizedBox(width: 4),
            Text(
              '${movie.voteAverage.toStringAsFixed(1)}/10 IMDb',
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ],
    );
  }
}
