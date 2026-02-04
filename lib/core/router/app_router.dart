import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/auth/presentation/providers/auth_provider.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/movies/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final isAuth = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
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
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/', builder: (_, __) => const HomeScreen()),
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
