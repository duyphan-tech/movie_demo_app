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

      if (authState.isLoading) {
        if (state.matchedLocation != RouterPath.initial) {
          return RouterPath.initial;
        }
        return null;
      }

      if (authState.hasError) {
        return RouterPath.login;
      }

      final isLoggedIn = authState.value ?? false;
      final isLoginRoute = state.matchedLocation == RouterPath.login;
      final isInitialRoute = state.matchedLocation == RouterPath.initial;

      if (isLoggedIn) {
        if (isLoginRoute || isInitialRoute) {
          return RouterPath.home;
        }
      } else {
        if (!isLoginRoute) {
          return RouterPath.login;
        }
      }

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
          final args = state.extra as Map<String, dynamic>;
          final int id = args['id'] as int;
          return MovieDetailScreen(movieId: id);
        },
      ),
      GoRoute(
        path: RouterPath.rated,
        name: RouterName.rated,
        builder: (context, state) => const RatedMoviesScreen(),
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
