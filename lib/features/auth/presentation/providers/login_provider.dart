import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  FutureOr<LoginResult> build() => const LoginResult();

  Future<void> login(String username, String password) async {
    state = const AsyncLoading();

    final result = await _repo.login(username, password);

    await result.fold(
      (failure) async {
        state = AsyncError(failure, StackTrace.current);
      },
      (userModel) async {
        final saveResult = await _repo.saveToken(userModel.token ?? '');
        await saveResult.fold(
          (saveFailure) async {
            state = AsyncError(saveFailure.message, StackTrace.current);
          },
          (_) async {
            await ref
                .read(authProvider.notifier)
                .authenticateUser(userModel.token ?? '');

            final pendingLinkAsync = ref.read(pendingDeepLinkProvider);
            final pendingLink = pendingLinkAsync.hasValue
                ? pendingLinkAsync.value
                : null;

            if (pendingLink != null && pendingLink.isNotEmpty) {
              await ref
                  .read(pendingDeepLinkProvider.notifier)
                  .clearPendingDeepLink();
              state = AsyncData(LoginResult(deepLinkPath: pendingLink));
            } else {
              state = const AsyncData(LoginResult());
            }
          },
        );
      },
    );
  }
}

class LoginResult {
  final String? deepLinkPath;

  const LoginResult({this.deepLinkPath});

  bool get hasDeepLink => deepLinkPath != null && deepLinkPath!.isNotEmpty;
}
