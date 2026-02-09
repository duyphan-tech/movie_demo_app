import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

final movieDetailProvider = FutureProvider.family<MovieDetail, int>((
  ref,
  movieId,
) async {
  final repository = ref.watch(movieRepositoryProvider);

  final result = await repository.getMovieDetail(movieId);

  return result.fold(
    (failure) => throw Exception(failure.message),
    (movieDetail) => movieDetail,
  );
});
