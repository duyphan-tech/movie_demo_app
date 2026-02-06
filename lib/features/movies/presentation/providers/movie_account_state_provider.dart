import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'movie_account_state_provider.g.dart';

@riverpod
class MovieAccountState extends _$MovieAccountState {
  @override
  Future<AccountState> build(int movieId) async {
    final repo = ref.watch(movieRepositoryProvider);

    final result = await repo.getMovieAccountState(movieId);

    return result.fold(
      (failure) => throw Exception(failure.message),
      (data) => data,
    );
  }

  void setLocalRating(double newRating) {
    final currentState = state.value;

    if (currentState != null) {
      state = AsyncData(
        AccountState(
          id: currentState.id,
          favorite: currentState.favorite,
          rating: newRating,
        ),
      );
    }
  }

  void deleteLocalRating() {
    state = AsyncData(
      AccountState(
        id: state.value?.id ?? 0,
        favorite: state.value?.favorite ?? false,
        rating: null,
      ),
    );
  }
}
