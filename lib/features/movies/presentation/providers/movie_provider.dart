import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../providers/movie_providers.dart';

class FavoritesNotifier extends StateNotifier<List<MovieDetail>> {
  FavoritesNotifier() : super([]);

  void toggleFavorite(MovieDetail movie) {
    if (state.contains(movie)) {
      state = state.where((m) => m.id != movie.id).toList();
    } else {
      state = [...state, movie];
    }
  }

  bool isFavorite(MovieDetail movie) => state.contains(movie);
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, List<MovieDetail>>(
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
