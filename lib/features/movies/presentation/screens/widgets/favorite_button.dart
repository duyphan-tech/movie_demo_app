import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';

class FavoriteButton extends ConsumerWidget {
  final int movieId;
  final Color? color;
  const FavoriteButton({super.key, required this.movieId, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(
      favoritesProvider.select((s) => s.contains(movieId)),
    );

    return IconButton(
      onPressed: () {
        ref.read(favoritesProvider.notifier).toggleFavorite(movieId);
      },
      icon: Icon(
        isFav ? Icons.bookmark : Icons.bookmark_border,
        color: isFav ? (color ?? Colors.indigo) : (color ?? Colors.black),
        size: 28,
      ),
    );
  }
}
