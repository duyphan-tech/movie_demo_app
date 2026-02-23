import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/router/router_name.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/auth/presentation/screens/login_screen.dart';
import 'package:movie_demo_app/features/core/presentation/screens/not_found_screen.dart';
import 'package:movie_demo_app/features/core/presentation/screens/splash_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/movie_detail_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/home_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated/rated_movies_screen_screen.dart';

import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  debugPrint(' 🔥🔥🔥 ROUTER PROVIDER BUILT! (Time: ${DateTime.now()})');
  final authNotifier = ValueNotifier<AsyncValue<bool>>(ref.read(authProvider));

  ref.listen<AsyncValue<bool>>(authProvider, (_, next) {
    authNotifier.value = next;
  });

  ref.onDispose(() {
    authNotifier.dispose();
  });

  return GoRouter(
    initialLocation: RouterPath.initial,
    debugLogDiagnostics: true,

    refreshListenable: authNotifier,
    redirect: (context, state) {
      final authState = authNotifier.value;
      final uri = state.uri;

      // Check if this is a deep link (custom scheme)
      final isDeepLink = uri.scheme == 'moviedemo';
      final isFromDeepLinkRoute = state.matchedLocation.startsWith('/') &&
                                  state.matchedLocation.length > 1 &&
                                  int.tryParse(state.matchedLocation.substring(1)) == null;

      debugPrint('🔀 Redirect - URI: $uri');
      debugPrint('🔀 Redirect - Scheme: ${uri.scheme}, Host: ${uri.host}, Path: ${uri.path}');
      debugPrint('🔀 Redirect - Matched: ${state.matchedLocation}');
      debugPrint('🔀 AuthState: loading=${authState.isLoading}, hasError=${authState.hasError}, isLoggedIn=${authState.value}');
      debugPrint('🔀 isDeepLink: $isDeepLink, isFromDeepLinkRoute: $isFromDeepLinkRoute');

      if (authState.isLoading) {
        // Don't redirect if coming from deep link - let it show NotFoundScreen
        if (isDeepLink && state.matchedLocation != RouterPath.initial) {
          debugPrint('🔀 Deep link detected while loading, no redirect');
          return null;
        }
        if (state.matchedLocation != RouterPath.initial) {
          debugPrint('🔀 Redirect to splash (auth loading)');
          return RouterPath.initial;
        }
        return null;
      }

      if (authState.hasError) {
        debugPrint('🔀 Redirect to login (auth error)');
        return RouterPath.login;
      }

      final isLoggedIn = authState.value ?? false;
      final isLoginRoute = state.matchedLocation == RouterPath.login;
      final isInitialRoute = state.matchedLocation == RouterPath.initial;

      if (isLoggedIn) {
        if (isLoginRoute || isInitialRoute) {
          // Check if we came from a deep link (path is numeric like /123)
          final pathId = int.tryParse(state.matchedLocation.substring(1));
          if (pathId != null) {
            debugPrint('🔀 Redirect to deep link: ${state.matchedLocation}');
            return null; // Stay on current route to show NotFoundScreen or MovieDetail
          }
          debugPrint('🔀 Redirect to home');
          return RouterPath.home;
        }
      } else {
        if (!isLoginRoute) {
          debugPrint('🔀 Redirect to login (not logged in)');
          return RouterPath.login;
        }
      }

      debugPrint('🔀 No redirect');
      return null;
    },
    routes: [
      GoRoute(
        path: RouterPath.initial,
        name: RouterName.initial,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouterPath.login,
        name: RouterName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouterPath.home,
        name: RouterName.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouterPath.details,
        name: RouterName.details,
        builder: (context, state) {
          final idString = state.pathParameters['id'];
          final int id = int.tryParse(idString ?? '') ?? 0;
          return MovieDetailScreen(movieId: id);
        },
      ),
      GoRoute(
        path: RouterPath.rated,
        name: RouterName.rated,
        builder: (context, state) => const RatedMoviesScreen(),
      ),
      // Handle custom scheme deep link: moviedemo://details/123
      // Must be last as it has generic pattern
      GoRoute(
        path: '/:id',
        builder: (context, state) {
          final uri = state.uri;
          final id = state.pathParameters['id'];
          // Only handle if this is from custom scheme with host=details and id is numeric
          if (uri.scheme == 'moviedemo' &&
              uri.host == 'details' &&
              id != null &&
              int.tryParse(id) != null) {
            return MovieDetailScreen(movieId: int.parse(id));
          }
          // Not a valid deep link
          return NotFoundScreen(path: uri.path);
        },
      ),
    ],
    errorBuilder: (context, state) {
      debugPrint('❌ GoRouter Error - URI: ${state.uri}');
      debugPrint('❌ GoRouter Error - Path: ${state.uri.path}');
      debugPrint('❌ GoRouter Error - Matched: ${state.matchedLocation}');
      debugPrint('❌ GoRouter Error - Error: ${state.error}');
      return NotFoundScreen(path: state.uri.path);
    },
  );
});
