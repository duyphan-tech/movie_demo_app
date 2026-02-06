import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';

import '../../../../core/errors/failures.dart';
import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie.dart';
import '../../domain/entities/movie_detail.dart';
import '../../providers/movie_providers.dart';

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
