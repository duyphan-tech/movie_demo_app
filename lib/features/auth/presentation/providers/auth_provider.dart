import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';

class AuthNotifier extends AsyncNotifier<bool> {
  @override
  Future<bool> build() async {
    final repo = ref.watch(authRepositoryProvider);
    final token = await repo.getSavedToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.login(username, password);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (userModel) async {
        await repo.saveToken(userModel.token ?? '');
        state = const AsyncData(true);
      },
    );
  }

  Future<void> register(String email, String password) async {
    state = const AsyncLoading();
    final repo = ref.read(authRepositoryProvider);
    final result = await repo.register(email, password);

    result.fold((failure) => state = AsyncError(failure, StackTrace.current), (
      token,
    ) async {
      await repo.saveToken(token);
      state = const AsyncData(true);
    });
  }

  Future<void> logout() async {
    state = const AsyncLoading();
    await ref.read(authRepositoryProvider).logout();
    state = const AsyncData(false);
  }
}

final authControllerProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});
