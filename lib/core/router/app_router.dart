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

import 'package:movie_demo_app/features/movies/movie.dart';
import 'package:movie_demo_app/features/auth/auth.dart';

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
        builder: (context, state) {
          return const RatedMoviesScreen();
        },
      ),
    ],
    errorBuilder: (context, state) {
      return NotFoundScreen(path: state.uri.path);
    },
  );
});
