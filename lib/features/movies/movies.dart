// Movies Feature Module
// Export all movies-related features for easy importing

// Data
export 'data/datasources/movie_remote_data_source.dart';
export 'data/models/account_state_model.dart';
export 'data/models/author_details_model.dart';
export 'data/models/genre_model.dart';
export 'data/models/movie_detail_model.dart';
export 'data/models/movie_model.dart';
export 'data/models/response/review_response_model.dart';
export 'data/models/review_model.dart';
export 'data/repositories/movie_repository_impl.dart';

// Domain
export 'domain/entities/account_state.dart';
export 'domain/entities/author_details.dart';
export 'domain/entities/genre.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/movie_detail.dart';
export 'domain/entities/review.dart';
export 'domain/entities/review_response.dart';
export 'domain/repositories/movie_repository.dart';

// Presentation - Providers
export 'presentation/providers/favorite_provider.dart';
export 'presentation/providers/home_provider.dart';
export 'presentation/providers/movie_account_state_provider.dart';
export 'presentation/providers/movie_detail_provider.dart';
export 'presentation/providers/movie_provider.dart';
export 'presentation/providers/rating_provider.dart';
export 'presentation/providers/review_provider.dart';
export 'presentation/providers/search_provider.dart';

// Presentation - Screens
export 'presentation/screens/detail/movie_detail_screen.dart';
export 'presentation/screens/favorite/favorite_movies_screen.dart';
export 'presentation/screens/home/home_screen.dart';
export 'presentation/screens/rated/rated_movies_screen_screen.dart';

// Public Providers (Providers barrel)
export 'providers/movie_providers.dart';
