import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  @override
  Future<List<Movie>> getPopularMovies() {
    return dataSource.fetchPopular();
  }
}

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(ref.watch(movieDataSourceProvider));
});
