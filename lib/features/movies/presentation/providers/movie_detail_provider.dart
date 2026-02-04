import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie_detail.dart';
import '../../providers/movie_providers.dart';

final movieDetailProvider = FutureProvider.family<MovieDetail, int>((ref, movieId) async {
  final repository = ref.watch(movieRepositoryProvider);

  final result = await repository.getMovieDetail(movieId);

  return result.fold(
        (failure) => throw Exception(failure.message),
        (movieDetail) => movieDetail,
  );
});