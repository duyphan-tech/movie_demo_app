import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/src/either.dart';
import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  Future<Either<Failure, List<Movie>>> _getMoviesFromSource(
    Future<Either<Failure, List<MovieModel>>> Function() callDataSource,
  ) async {
    final result = await callDataSource();
    return result;
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() =>
      _getMoviesFromSource(() => dataSource.getPopularMovies());

  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() =>
      _getMoviesFromSource(() => dataSource.getNowPlayingMovies());

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() =>
      _getMoviesFromSource(() => dataSource.getTopRatedMovies());

  @override
  Future<Either<Failure, List<Movie>>> getUpcomingMovies() =>
      _getMoviesFromSource(() => dataSource.getUpcomingMovies());

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id) async {
    return dataSource.getMovieDetail(id);
  }
}
