# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Flutter movie application using The Movie Database (TMDB) API. It demonstrates a production-ready architecture with Riverpod state management, go_router navigation, and clean architecture principles.

## Development Commands

### Running the App

The project uses FVM (Flutter Version Management) with the stable channel configured in `.fvmrc`.

```bash
# Run development flavor
flutter run lib/main_dev.dart --flavor dev \
  --dart-define TMDB_API_KEY=<key> \
  --dart-define TMDB_URL=https://api.themoviedb.org/3 \
  --dart-define REGRES_URL=https://reqres.in/api \
  --dart-define DUMMY_URL=https://dummyjson.com \
  --dart-define SESSION_ID=<session> \
  --dart-define ACCOUNT_ID=<account>

# Run production flavor
flutter run lib/main_prod.dart --flavor prod \
  --dart-define TMDB_API_KEY=<key> \
  --dart-define TMDB_URL=https://api.themoviedb.org/3 \
  --dart-define REGRES_URL=https://reqres.in/api \
  --dart-define DUMMY_URL=https://dummyjson.com \
  --dart-define SESSION_ID=<session> \
  --dart-define ACCOUNT_ID=<account>
```

VS Code launch configurations are pre-configured in `.vscode/launch.json` with these dart-defines.

### Code Generation

This project uses code generation extensively. Generated files are output to `generated/` subdirectories within each feature folder.

```bash
# Generate code (riverpod, freezed, json_serializable)
flutter pub run build_runner build

# Watch for changes during development
flutter pub run build_runner watch

# Delete conflicting outputs and rebuild
flutter pub run build_runner build --delete-conflicting-outputs
```

### Testing

```bash
# Run all tests
flutter test

# Run a specific test file
flutter test test/widget_test.dart

# Run integration tests
flutter test integration_test/migration_test.dart
```

### Localization

```bash
# Generate localization files (runs automatically with `flutter run`)
flutter gen-l10n
```

ARB source files are in `lib/l10n/arb/` (intl_en.arb, intl_vi.arb). Generated files are output to the same directory.

### Linting

```bash
# Analyze code
flutter analyze

# Fix auto-fixable issues
flutter fix --apply
```

## Architecture

### Project Structure

The project follows a **feature-based clean architecture** with the following layers:

```
lib/
├── core/                      # Shared core functionality
│   ├── configs/              # App configuration, environment settings
│   ├── constants/            # App constants, sizes, assets
│   ├── deeplink/             # AppsFlyer deep linking service
│   ├── errors/               # Failure classes and exceptions
│   ├── local/                # SharedPreferences-based local storage
│   ├── logger/               # AppLogger utility
│   ├── network/              # Dio API client, interceptors, endpoints
│   ├── providers/            # Global Riverpod providers (theme, locale, storage)
│   ├── router/               # go_router configuration and route definitions
│   ├── theme/                # AppTheme, colors, typography
│   └── utils/                # Extensions, custom hooks, shared widgets
├── features/                  # Feature modules
│   ├── auth/                 # Authentication feature
│   │   ├── data/            # Data layer (models, datasources, repositories)
│   │   ├── domain/          # Domain layer (entities, repository interfaces)
│   │   └── presentation/    # UI layer (screens, providers, widgets)
│   ├── movies/              # Movies feature (same structure as auth)
│   └── core/                # Core screens (splash, not found)
├── l10n/                     # Localization
└── main*.dart               # Entry points
```

### State Management with Riverpod

The project uses Riverpod 3.x with the following patterns:

- **AsyncNotifier** for stateful business logic (e.g., `HomeNotifier`, `LoginNotifier`)
- **@riverpod** annotation for code generation
- **AsyncValue** for handling loading/error states
- Providers are organized by feature in `presentation/providers/`

Generated provider files follow the pattern: `generated/<provider_name>.g.dart`

Example pattern from `home_provider.dart`:
```dart
@riverpod
class HomeNotifier extends _$HomeNotifier {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);

  @override
  Future<HomeState> build() async {
    // Initial load
  }

  Future<void> loadMorePopular() async {
    // Pagination logic
  }
}
```

### Repository Pattern with Functional Error Handling

Repositories use `fpdart` for functional error handling with `Either<Failure, T>`:

```dart
Future<Either<Failure, List<Movie>>> getPopularMovies({int page = 1});
```

The `ApiClient` class wraps Dio requests and returns `Either<Failure, dynamic>`, mapping DioExceptions to typed Failures (ServerFailure, UnauthorizedFailure, etc.).

### Navigation with go_router

Navigation is centralized in `core/router/app_router.dart`:

- `routerProvider` creates the GoRouter instance
- Routes are defined with path constants from `RouterPath` and names from `RouterName`
- Authentication-based redirects are handled in the router's `redirect` callback
- Route parameters use GoRouter's pathParameters (e.g., `/details/:id`)

### Local Storage Architecture

Uses `SharedPreferencesAsync` (modern API) with a migration strategy from legacy `SharedPreferences`:

- `LocalStorageService` - Main storage interface
- `StorageMigrationService` - Handles migration from old to new storage
- `appInitializationProvider` - Runs migrations on app startup

### Custom Hooks

Reusable logic is encapsulated in custom Flutter hooks in `core/utils/hooks/`:

- `useAsyncLock` - Prevents concurrent async operations
- `useDebounce` - Debounces values
- `useInfiniteScroll` - Infinite scroll pagination logic

### Code Generation Configuration

The `build.yaml` configures output directories for generated files:

```yaml
# Generated files are placed in generated/ subdirectories
'lib/{{path}}/{{file}}.dart': 'lib/{{path}}/generated/{{file}}.g.dart'
```

This applies to Riverpod, Freezed, and JSON Serializable generators.

## Key Dependencies

- **flutter_riverpod / hooks_riverpod**: State management
- **go_router**: Navigation
- **dio**: HTTP client
- **fpdart**: Functional programming utilities
- **freezed**: Immutable data classes
- **shared_preferences**: Local storage
- **appsflyer_sdk**: Deep linking and attribution
- **cached_network_image**: Image caching
- **shimmer**: Loading placeholders
- **flutter_easyloading**: Toast/loading indicators
- **connectivity_plus**: Network state monitoring
