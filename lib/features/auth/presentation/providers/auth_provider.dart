import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../../data/repositories/auth_repository_impl.dart';

class AuthNotifier extends StateNotifier<AsyncValue<void>> {
  final AuthRepositoryImpl _repository;

  AuthNotifier(this._repository) : super(const AsyncValue.data(null));

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.login(email, password);
    });
  }

  Future<void> register(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _repository.register(email, password);
    });
  }

  void logout() {
    state = const AsyncValue.data(null);
  }
}

final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<void>>((ref) {
  return AuthNotifier(ref.watch(authRepositoryProvider));
});