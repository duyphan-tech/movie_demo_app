import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/features/movies/data/datasources/movie_remote_data_source.dart';
import 'package:movie_demo_app/features/movies/data/models/account_state_model.dart';
import 'package:movie_demo_app/features/movies/data/models/movie_detail_model.dart';
import 'package:movie_demo_app/features/movies/data/models/movie_model.dart';
import 'package:movie_demo_app/features/movies/data/models/review_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource dataSource;

  MovieRepositoryImpl(this.dataSource);

  Future<Either<Failure, List<Movie>>> _getMoviesFromSource(
    Future<Either<Failure, List<MovieModel>>> Function() callDataSource,
  ) async {
    final result = await callDataSource();
    return result.map(
      (movieModels) => movieModels.map((model) => model.toDomain()).toList(),
    );
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1}) =>
      _getMoviesFromSource(() => dataSource.getPopularMovies(page: page));

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
    final result = await dataSource.getMovieDetail(id);
    return result.map((model) => model.toDomain());
  }

  @override
  Future<Either<Failure, List<Review>>> getMovieReviews(int movieId) async {
    final result = await dataSource.getMovieReviews(movieId);
    return result.map(
      (models) => models.map((model) => model.toDomain()).toList(),
    );
  }

  @override
  Future<Either<Failure, bool>> markAsFavorite({
    required int movieId,
    required bool isFavorite,
    CancelToken? cancelToken,
  }) async {
    return dataSource.markAsFavorite(movieId: movieId, isFavorite: isFavorite);
  }

  @override
  Future<Either<Failure, bool>> rateMovie({
    required int movieId,
    required double value,
  }) async => dataSource.rateMovie(movieId: movieId, value: value);

  @override
  Future<Either<Failure, List<Movie>>> getRatedMovies({int page = 1}) =>
      _getMoviesFromSource(() => dataSource.getRatedMovies(page: page));

  @override
  Future<Either<Failure, List<Movie>>> getFavoriteMovies() =>
      _getMoviesFromSource(() => dataSource.getFavoriteMovies());

  @override
  Future<Either<Failure, AccountState>> getMovieAccountState(
    int movieId,
  ) async {
    final result = await dataSource.getMovieAccountState(movieId);
    return result.map((model) => model.toDomain());
  }

  @override
  Future<Either<Failure, bool>> deleteRating({required int movieId}) {
    return dataSource.deleteRating(movieId: movieId);
  }
}
