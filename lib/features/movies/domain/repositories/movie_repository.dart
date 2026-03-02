import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';

import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

abstract class MovieRepository {
  Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1});
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getUpcomingMovies();
  Future<Either<Failure, MovieDetail>> getMovieDetail(int id);
  Future<Either<Failure, List<Review>>> getMovieReviews(int movieId);
  Future<Either<Failure, bool>> markAsFavorite({
    required int movieId,
    required bool isFavorite,
    CancelToken? cancelToken,
  });
  Future<Either<Failure, bool>> rateMovie({
    required int movieId,
    required double value,
  });

  Future<Either<Failure, List<Movie>>> getRatedMovies({int page = 1});
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
  Future<Either<Failure, AccountState>> getMovieAccountState(int movieId);
  Future<Either<Failure, bool>> deleteRating({required int movieId});

  Future<Either<Failure, List<Movie>>> searchMovies({
    required String query,
    int page = 1,
    CancelToken? cancelToken,
  });

  Future<Either<Failure, VideoResponse>> getMovieVideos(int movieId);
}
