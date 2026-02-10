import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';

class AuthNotifier extends AsyncNotifier<bool> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  Future<bool> build() async {
    final token = await _repo.getSavedToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    final result = await _repo.login(username, password);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (userModel) async {
        await _repo.saveToken(userModel.token ?? '');
        state = const AsyncData(true);
      },
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    final result = await _repo.register(email, password);

    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      token,
    ) async {
      await _repo.saveToken(token);
      state = const AsyncData(true);
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(false);
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});
