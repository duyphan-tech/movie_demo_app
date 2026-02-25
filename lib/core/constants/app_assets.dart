library;

class AppAssets {
  AppAssets._();

  // ====================
  // Base Paths
  // ====================
  static const String images = 'assets/images/';
  static const String icons = 'assets/icons/';
  static const String animations = 'assets/animations/';
  static const String fonts = 'assets/fonts/';

  // ====================
  // Images
  // ====================
  static const String placeholderMovie = '${images}placeholder_movie.png';
  static const String placeholderPoster = '${images}placeholder_poster.png';
  static const String emptyState = '${images}empty_state.png';
  static const String errorState = '${images}error_state.png';
  static const String noResults = '${images}no_results.png';

  // ====================
  // Icons (SVG/PNG)
  // ====================
  static const String iconHome = '${icons}ic_home.svg';
  static const String iconSearch = '${icons}ic_search.svg';
  static const String iconFavorites = '${icons}ic_favorites.svg';
  static const String iconProfile = '${icons}ic_profile.svg';
  static const String iconPlay = '${icons}ic_play.svg';
  static const String iconStar = '${icons}ic_star.svg';
  static const String iconHeart = '${icons}ic_heart.svg';
  static const String iconHeartFilled = '${icons}ic_heart_filled.svg';

  // ====================
  // Animations (Lottie)
  // ====================
  static const String loadingAnimation = '${animations}loading.json';
  static const String successAnimation = '${animations}success.json';
  static const String errorAnimation = '${animations}error.json';
}
