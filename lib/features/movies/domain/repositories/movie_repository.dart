import '../entities/movie.dart';
import '../entities/movie_detail.dart';

abstract class MovieRepository {
  Future<List<Movie>> getPopularMovies();
  Future<MovieDetail> getMovieDetail(int id);
}