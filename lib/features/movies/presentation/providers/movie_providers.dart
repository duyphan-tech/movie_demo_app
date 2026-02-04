import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';

final popularMoviesProvider = FutureProvider<List<Movie>>((ref) async {
  final repository = ref.watch(movieRepositoryProvider);
  return repository.getPopularMovies();
});

class FavoritesNotifier extends StateNotifier<List<Movie>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(Movie movie) {
    if (state.contains(movie)) {
      state = state.where((m) => m.id != movie.id).toList();
    } else {
      state = [...state, movie];
    }
  }

  bool isFavorite(Movie movie) => state.contains(movie);
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<Movie>>(
  (ref) {
    return FavoritesNotifier();
  },
);
