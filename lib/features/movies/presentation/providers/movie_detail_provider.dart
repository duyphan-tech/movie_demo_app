import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/movie_repository_impl.dart';
import '../../domain/entities/movie_detail.dart';

final movieDetailProvider = FutureProvider.family<MovieDetail, int>((ref, movieId) async {
  final repository = ref.watch(movieRepositoryProvider);

  return repository.getMovieDetail(movieId);
});