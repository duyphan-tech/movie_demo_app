import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/login_provider.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  AuthRepository get _repo => ref.read(authRepositoryProvider);

  @override
  FutureOr<void> build() {}
  Future<void> login(String username, String password) async {
    state = const AsyncLoading();

    final result = await _repo.login(username, password);

    result.fold(
      (failure) {
        state = AsyncError(failure, StackTrace.current);
      },
      (userModel) async {
        await _repo.saveToken(userModel.token ?? '');

        await ref
            .read(authProvider.notifier)
            .authenticateUser(userModel.token ?? '');

        state = const AsyncData(null);
      },
    );
  }
}
