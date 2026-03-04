import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';

class AuthNotifier extends AsyncNotifier<bool> {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  Future<bool> build() async {
    final token = await _repo.getSavedToken();
    return token != null && token.isNotEmpty;
  }

  Future<void> authenticateUser(String token) async {
    state = const AsyncData(true);
  }

  Future<String?> loginWithDeepLink(String username, String password) async {
    final result = await _repo.login(username, password);

    return result.fold((failure) => null, (userModel) async {
      final saveResult = await _repo.saveToken(userModel.token ?? '');
      return saveResult.fold((saveFailure) => null, (_) async {
        await authenticateUser(userModel.token ?? '');

        final pendingLinkAsync = ref.read(pendingDeepLinkProvider);
        final pendingLink = pendingLinkAsync.hasValue
            ? pendingLinkAsync.value
            : null;

        if (pendingLink != null && pendingLink.isNotEmpty) {
          await ref
              .read(pendingDeepLinkProvider.notifier)
              .clearPendingDeepLink();
          return pendingLink;
        }

        return null;
      });
    });
  }

  Future<void> logout() async {
    final result = await ref.read(authRepositoryProvider).logout();
    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (_) => state = const AsyncData(false),
    );
  }
}

final authProvider = AsyncNotifierProvider<AuthNotifier, bool>(() {
  return AuthNotifier();
});
