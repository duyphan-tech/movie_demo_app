import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

Future<List<Movie>> _fetchData(
  Future<Either<Failure, List<Movie>>> Function() useCase,
) async {
  final result = await useCase();
  return result.fold(
    (failure) => throw Exception(failure.message),
    (movies) => movies,
  );
}

final ratedMoviesProvider = FutureProvider.autoDispose<List<Movie>>((ref) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getRatedMovies());
});

final favoriteMoviesListProvider = FutureProvider.autoDispose<List<Movie>>((
  ref,
) {
  final repo = ref.watch(movieRepositoryProvider);
  return _fetchData(() => repo.getFavoriteMovies());
});

final currentMovieIdProvider = Provider<int>(
  (ref) => throw UnimplementedError(),
);
