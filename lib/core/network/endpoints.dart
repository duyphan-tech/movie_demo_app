class Endpoints {
  const Endpoints._();
  static const String popularMovie = '/movie/popular';
  static const String nowPlayingMovie = '/movie/now_playing';
  static const String topRatedMovie = '/movie/top_rated';
  static const String upcomingMovie = '/movie/upcoming';
  static const String movieDetail = '/movie';

  static const String login = '/auth/login';
  static const String register = '/register';
  static const String logout = '/logout';

  static String movieReviews(int movieId) => '/movie/$movieId/reviews';
  static String movieAccountState(int movieId) =>
      '/movie/$movieId/account_states';
  static String favorite(String accountId) => '/account/$accountId/favorite';
  static String favoriteMovies(String accountId) =>
      '/account/$accountId/favorite/movies';
  static String rating(int movieId) => '/movie/$movieId/rating';
  static String ratedMovies(String accountId) =>
      '/account/$accountId/rated/movies';
  static String deleteRating(int movieId) => '/movie/$movieId/rating';
}
