import 'package:movie_demo_app/features/movies/domain/entities/account_state.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'generated/movie_account_state_provider.g.dart';

@riverpod
class MovieAccountStateNotifier extends _$MovieAccountStateNotifier {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);

  @override
  Future<AccountState> build(int movieId) async {
    final result = await _movieRepo.getMovieAccountState(movieId);

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
