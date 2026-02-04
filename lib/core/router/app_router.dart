import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/router/router_path.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/movies/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/movies/presentation/screens/movie_detail_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: RouterPath.home,
    // refreshListenable: GoRouterRefreshStream(
    //   ref.watch(authStateProvider.notifier).stream,
    // ),
    redirect: (context, state) {
      // final isLoginRoute = state.matchedLocation == '/login';
      // if (!isAuth && !isLoginRoute) return '/login';
      // if (isAuth && isLoginRoute) return '/';
      // return null;
    },
    routes: [
      GoRoute(path: RouterPath.login, builder: (_, __) => const LoginScreen()),
      GoRoute(path: RouterPath.home, builder: (_, __) => const HomeScreen()),
      GoRoute(
        path: RouterPath.details,
        builder: (context, state) {
          final args = state.extra as Map<String, dynamic>;
          final int id = args['id'] as int;

          return MovieDetailScreen(movieId: id);
        },
      ),
    ],
  );
});

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final dynamic _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
