import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_demo_app/features/auth/auth.dart';
import 'package:movie_demo_app/features/core/core.dart';
import 'package:movie_demo_app/features/movies/movies.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/search/search_screen.dart';

import 'router_name.dart';
import 'router_path.dart';

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

      final isDeepLink = uri.scheme == 'moviedemo';
      final isFromDeepLinkRoute =
          state.matchedLocation.startsWith('/') &&
          state.matchedLocation.length > 1 &&
          int.tryParse(state.matchedLocation.substring(1)) == null;

      debugPrint('🔀 Redirect - URI: $uri');
      debugPrint(
        '🔀 Redirect - Scheme: ${uri.scheme}, Host: ${uri.host}, Path: ${uri.path}',
      );
      debugPrint('🔀 Redirect - Matched: ${state.matchedLocation}');
      debugPrint(
        '🔀 AuthState: loading=${authState.isLoading}, hasError=${authState.hasError}, isLoggedIn=${authState.value}',
      );
      debugPrint(
        '🔀 isDeepLink: $isDeepLink, isFromDeepLinkRoute: $isFromDeepLinkRoute',
      );

      if (authState.isLoading) {
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
          final pathId = int.tryParse(state.matchedLocation.substring(1));
          if (pathId != null) {
            debugPrint('🔀 Redirect to deep link: ${state.matchedLocation}');
            return null;
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
        path: RouterPath.search,
        name: RouterName.search,
        builder: (context, state) => const SearchScreen(),
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
      GoRoute(
        path: '/:id',
        builder: (context, state) {
          final uri = state.uri;
          final id = state.pathParameters['id'];
          if (uri.scheme == 'moviedemo' &&
              uri.host == 'details' &&
              id != null &&
              int.tryParse(id) != null) {
            return MovieDetailScreen(movieId: int.parse(id));
          }
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
