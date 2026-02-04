import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

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

  @override
  Future<MovieDetail> getMovieDetail(int id) {
    return dataSource.fetchMovieDetail(id);
  }
}

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(ref.watch(movieDataSourceProvider));
});
