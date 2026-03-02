# movie_demo_app

A Flutter movie demo application with multi-environment support.

## Flavors

Project uses 3 flavors managed by [flutter_flavorizr](https://pub.dev/packages/flutter_flavorizr):

| Flavor | App Name | Bundle ID (Android) | Bundle ID (iOS) |
|--------|----------|---------------------|-----------------|
| dev | My App (Dev) | com.example.movie_demo_app.dev | com.example.movie-demo-app.dev |
| staging | My App (Staging) | com.example.movie_demo_app.staging | com.example.movie-demo-app.staging |
| prod | My App | com.example.movie_demo_app | com.example.movie-demo-app |

## Build Commands

### Run

```bash
flutter run --flavor dev
flutter run --flavor staging
flutter run --flavor prod
```

### Build APK

```bash
flutter build apk --flavor dev
flutter build apk --flavor staging
flutter build apk --flavor prod
```

### Build iOS

```bash
flutter build ios --flavor dev
flutter build ios --flavor staging
flutter build ios --flavor prod
```

### VS Code

Select flavor from Run and Debug panel (Ctrl+Shift+D):
- `movie_demo_app (dev)`
- `movie_demo_app (staging)`
- `movie_demo_app (prod)`

## Deep Links

| Flavor | Scheme | Example URL |
|--------|--------|-------------|
| dev | `moviedemodev` | `moviedemodev://details/123` |
| staging | `moviedemostaging` | `moviedemostaging://details/123` |
| prod | `moviedemo` | `moviedemo://details/123` |

## Architecture

- **State Management**: Riverpod 2.x
- **Navigation**: GoRouter
- **Networking**: Dio
- **Architecture Pattern**: Feature-Based Clean Architecture

## Getting Started

```bash
# Install dependencies
flutter pub get

# Run code generation
flutter pub run build_runner build

# Run with dev flavor
flutter run --flavor dev
```

See [docs/FLAVOR_MIGRATION.md](docs/FLAVOR_MIGRATION.md) for migration details.
