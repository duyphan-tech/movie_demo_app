import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

import '../../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../entities/movie_detail.dart';

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
  });
  Future<Either<Failure, bool>> rateMovie({
    required int movieId,
    required double value,
  });

  Future<Either<Failure, List<Movie>>> getRatedMovies({int page = 1});
  Future<Either<Failure, List<Movie>>> getFavoriteMovies();
  Future<Either<Failure, AccountState>> getMovieAccountState(int movieId);
  Future<Either<Failure, bool>> deleteRating({required int movieId});
}
