import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/common/error_view.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/favorite/widgets/favorite_grid.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/empty_state.dart';

class FavoriteMoviesScreen extends HookConsumerWidget {
  const FavoriteMoviesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoritesAsync = ref.watch(favoriteMoviesListProvider);

    final favoriteIds = ref.watch(favoritesProvider);

    final onRefresh = useCallback(() async {
      return ref.refresh(favoriteMoviesListProvider.future);
    }, []);

    ref.listen(favoriteMoviesListProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.error}: ${next.error}'),
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

        error: (err, stack) => ErrorView(error: err, onRetry: onRefresh),

        data: (movies) {
          final activeMovies = movies
              .where((movie) => favoriteIds.contains(movie.id))
              .toList();
          if (activeMovies.isEmpty) {
            return RefreshIndicator(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height - kToolbarHeight,
                  child: const EmptyState(),
                ),
              ),
            );
          }

          return RefreshIndicator(
            onRefresh: onRefresh,
            child: FavoriteGrid(movies: activeMovies),
          );
        },
      ),
    );
  }
}
