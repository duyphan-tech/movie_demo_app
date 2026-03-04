import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/features/auth/auth.dart';
import 'package:movie_demo_app/features/core/core.dart';
import 'package:movie_demo_app/features/movies/movies.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/search/search_screen.dart';

import 'router_name.dart';
import 'router_path.dart';

final routerProvider = Provider<GoRouter>((ref) {
  AppLogger.d('🔥 ROUTER PROVIDER BUILT! (Time: ${DateTime.now()})', tag: 'Router');
  final authNotifier = ValueNotifier<AsyncValue<bool>>(ref.read(authProvider));
  final pendingLinkNotifier = ValueNotifier<String?>(null);

  ref.listen<AsyncValue<bool>>(authProvider, (_, next) {
    authNotifier.value = next;
  });

  ref.listen<AsyncValue<String?>>(pendingDeepLinkProvider, (_, next) {
    if (next.hasValue && next.value != null && next.value!.isNotEmpty) {
      pendingLinkNotifier.value = next.value;
    }
  });

  ref.onDispose(() {
    authNotifier.dispose();
    pendingLinkNotifier.dispose();
  });

  final config = ref.watch(appConfigProvider).deepLinkConfig;

  return GoRouter(
    initialLocation: RouterPath.initial,
    debugLogDiagnostics: true,

    refreshListenable: Listenable.merge([authNotifier, pendingLinkNotifier]),
    redirect: (context, state) {
      final authState = authNotifier.value;
      final uri = state.uri;

      final isDeepLink = config.useHttps
          ? uri.scheme == 'https' && uri.host == config.host
          : uri.scheme == config.scheme &&
                (config.host == null || uri.host == config.host);
      final isFromDeepLinkRoute =
          state.matchedLocation.startsWith('/') &&
          state.matchedLocation.length > 1 &&
          int.tryParse(state.matchedLocation.substring(1)) == null;

      AppLogger.d('Redirect - URI: $uri', tag: 'Router');
      AppLogger.d(
        'Redirect - Scheme: ${uri.scheme}, Host: ${uri.host}, Path: ${uri.path}',
        tag: 'Router',
      );
      AppLogger.d('Redirect - Matched: ${state.matchedLocation}', tag: 'Router');
      AppLogger.d(
        'AuthState: loading=${authState.isLoading}, hasError=${authState.hasError}, isLoggedIn=${authState.value}',
        tag: 'Router',
      );
      AppLogger.d(
        'isDeepLink: $isDeepLink (config: ${config.scheme}://${config.host}), isFromDeepLinkRoute: $isFromDeepLinkRoute',
        tag: 'Router',
      );

      if (authState.isLoading) {
        if (isDeepLink && state.matchedLocation != RouterPath.initial) {
          AppLogger.d('Deep link detected while loading, no redirect', tag: 'Router');
          return null;
        }
        if (state.matchedLocation != RouterPath.initial) {
          AppLogger.d('Redirect to splash (auth loading)', tag: 'Router');
          return RouterPath.initial;
        }
        return null;
      }

      if (authState.hasError) {
        AppLogger.d('Redirect to login (auth error)', tag: 'Router');
        return RouterPath.login;
      }

      final isLoggedIn = authState.value ?? false;
      final isLoginRoute = state.matchedLocation == RouterPath.login;
      final isInitialRoute = state.matchedLocation == RouterPath.initial;

      if (isLoggedIn) {
        if (isLoginRoute || isInitialRoute) {
          final pendingLink =
              pendingLinkNotifier.value ??
              (ref.read(pendingDeepLinkProvider).hasValue
                  ? ref.read(pendingDeepLinkProvider).value
                  : null);
          if (pendingLink != null && pendingLink.isNotEmpty) {
            AppLogger.i('Redirect to pending deep link: $pendingLink', tag: 'Router');
            pendingLinkNotifier.value = null;
            ref.read(pendingDeepLinkProvider.notifier).clearPendingDeepLink();
            return pendingLink;
          }

          final pathId = int.tryParse(state.matchedLocation.substring(1));
          if (pathId != null) {
            AppLogger.i('Redirect to deep link: ${state.matchedLocation}', tag: 'Router');
            return null;
          }
          AppLogger.i('Redirect to home', tag: 'Router');
          return RouterPath.home;
        }
      } else {
        if (!isLoginRoute) {
          if (isDeepLink && uri.host == config.host) {
            final id = uri.pathSegments.isNotEmpty
                ? uri.pathSegments.first
                : null;
            if (id != null && int.tryParse(id) != null) {
              final path = '/details/$id';
              ref
                  .read(pendingDeepLinkProvider.notifier)
                  .savePendingDeepLink(path);
              AppLogger.i('Saved pending deep link: $path', tag: 'Router');
            }
          }
          AppLogger.d('Redirect to login (not logged in)', tag: 'Router');
          return RouterPath.login;
        }
      }

      AppLogger.d('No redirect', tag: 'Router');
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
          final isValidDeepLink = config.useHttps
              ? uri.scheme == 'https' && uri.host == config.host
              : uri.scheme == config.scheme &&
                    (config.host == null || uri.host == config.host);
          if (isValidDeepLink && id != null && int.tryParse(id) != null) {
            return MovieDetailScreen(movieId: int.parse(id));
          }
          return NotFoundScreen(path: uri.path);
        },
      ),
    ],
    errorBuilder: (context, state) {
      AppLogger.e(
        'GoRouter Error',
        tag: 'Router',
        error: state.error,
      );
      return NotFoundScreen(path: state.uri.path);
    },
  );
});
