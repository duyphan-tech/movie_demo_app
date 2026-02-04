import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import '../../providers/auth_providers.dart';

class AuthController extends AsyncNotifier<bool> {
  late AuthRepository _repo;

  @override
  Future<bool> build() async {
    _repo = ref.watch(authRepositoryProvider);
    final token = await _repo.getSavedToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    final result = await _repo.login(email, password);

    result.fold(
      (failure) {
        state = AsyncError(failure.message, StackTrace.current);
      },
      (token) {
        state = const AsyncData(true);
      },
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    final result = await _repo.register(email, password);

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (token) => state = const AsyncData(true),
    );
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await _repo.logout();
    state = const AsyncData(false);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthController, bool>(() {
  return AuthController();
});
