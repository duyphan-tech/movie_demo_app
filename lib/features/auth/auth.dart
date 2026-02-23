// Auth Feature Module
// Export all auth-related features for easy importing

// Barrel file for Auth Feature

// Data
export 'data/datasources/local/auth_local_data_source.dart';
export 'data/datasources/remote/auth_remote_data_source.dart';
export 'data/models/user_model.dart';
export 'data/repositories/auth_repository_impl.dart';

// Domain
export 'domain/entities/user.dart';
export 'domain/repositories/auth_repository.dart';

// Presentation - Providers
export 'presentation/providers/auth_provider.dart';
export 'presentation/providers/login_provider.dart';

// Presentation - Screens
export 'presentation/screens/login_screen.dart';

// Public Providers (Providers barrel)
export 'providers/auth_providers.dart';
