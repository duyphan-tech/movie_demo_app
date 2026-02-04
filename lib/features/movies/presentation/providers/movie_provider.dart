import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../providers/movie_providers.dart';

//
// final popularMoviesProvider = FutureProvider<List<Movie>>((ref) async {
//   final repository = ref.watch(movieRepositoryProvider);
//   return repository.getPopularMovies();
// });

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

Future<List<Movie>> _fetchData(
  Future<Either<Failure, List<Movie>>> Function() useCase,
) async {
  final result = await useCase();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (movies) => movies,
  );
}

final nowPlayingMoviesProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getNowPlayingMovies());
});

final popularMoviesProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getPopularMovies());
});

final topRatedMoviesProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getTopRatedMovies());
});

final upcomingMoviesProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getUpcomingMovies());
});
