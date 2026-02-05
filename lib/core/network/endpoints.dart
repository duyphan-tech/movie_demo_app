class Endpoints {
  const Endpoints._();
  static const String popularMovie = '/movie/popular';
  static const String nowPlayingMovie = '/movie/now_playing';
  static const String topRatedMovie = '/movie/top_rated';
  static const String upcomingMovie = '/movie/upcoming';
  static const String movieDetail = '/movie';

  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';

  static String movieReviews(int movieId) => '/movie/$movieId/reviews';
  static String favorite(int accountId) => '/account/$accountId/favorite';

}