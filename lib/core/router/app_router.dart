import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/router/router_name.dart';
import 'package:movie_demo_app/core/router/router_path.dart';

import '../../features/auth/presentation/providers/auth_controller.dart';
import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/movies/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

import '../../features/movies/presentation/screens/movie_detail_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: RouterPath.home,
    debugLogDiagnostics: true,

    // refreshListenable: AuthStateListenable(authState),

    // redirect: (context, state) {
    //   if (authState.isLoading || authState.hasError) return null;
    //
    //   final isLoggedIn = authState.asData?.value ?? false;
    //   final isLoginRoute = state.matchedLocation == RouterPath.login;
    //
    //   if (isLoggedIn && isLoginRoute) {
    //     return RouterPath.home;
    //   }
    //
    //   if (!isLoggedIn && !isLoginRoute) {
    //     return RouterPath.login;
    //   }
    //
    //   return null;
    // },
    routes: [
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
    ],
  );
});

class AuthStateListenable extends ChangeNotifier {
  AuthStateListenable(AsyncValue<bool> state) {
    if (!state.isLoading) notifyListeners();
  }
}
