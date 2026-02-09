import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/empty_state.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_grid.dart';

class FavoriteMoviesScreen extends HookConsumerWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteMoviesListProvider);

    ref.listen(favoriteMoviesListProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Lỗi: ${next.error}'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: Text(
          context.l10n.favoriteList,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: favoritesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),

        error: (err, stack) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 48, color: Colors.red),
              const SizedBox(height: 16),
              Text(
                context.l10n.dataLoadError,
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),

        data: (movies) {
          if (movies.isEmpty) {
            return const EmptyState();
          }
          return FavoriteGrid(movies: movies);
        },
      ),
    );
  }
}
