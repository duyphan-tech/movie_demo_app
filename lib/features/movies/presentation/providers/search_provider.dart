import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_provider.g.dart';
part 'search_provider.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    required List<Movie> movies,
    required String query,
    required bool hasMore,
    required int currentPage,
  }) = _SearchState;

  factory SearchState.initial() =>
      const SearchState(movies: [], query: '', hasMore: false, currentPage: 1);
}

@riverpod
class SearchNotifier extends _$SearchNotifier {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);
  CancelToken? _cancelToken;

  @override
  Future<SearchState> build() async {
    ref.onDispose(() {
      _cancelToken?.cancel();
    });
    return SearchState.initial();
  }

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      state = AsyncData(SearchState.initial());
      return;
    }

    _cancelToken?.cancel();
    _cancelToken = CancelToken();

    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<SearchState>().copyWithPrevious(state);

    final result = await _movieRepo.searchMovies(
      query: query.trim(),
      page: 1,
      cancelToken: _cancelToken,
    );

    result.fold(
      (failure) {
        if (_cancelToken?.isCancelled ?? false) return;
        state = AsyncError(failure.message, StackTrace.current);
      },
      (movies) {
        state = AsyncData(
          SearchState(
            movies: movies,
            query: query.trim(),
            hasMore: movies.length >= 20,
            currentPage: 1,
          ),
        );
      },
    );
  }

  Future<void> loadMore() async {
    if (state.hasError || state.isLoading) return;

    final currentState = state.value;
    if (currentState == null ||
        currentState.query.isEmpty ||
        !currentState.hasMore) {
      return;
    }

    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<SearchState>().copyWithPrevious(state);

    final nextPage = currentState.currentPage + 1;

    final result = await _movieRepo.searchMovies(
      query: currentState.query,
      page: nextPage,
    );

    result.fold(
      (failure) => state = AsyncError(failure.message, StackTrace.current),
      (newMovies) {
        if (newMovies.isEmpty) {
          state = AsyncData(currentState.copyWith(hasMore: false));
          return;
        }

        state = AsyncData(
          currentState.copyWith(
            movies: [...currentState.movies, ...newMovies],
            currentPage: nextPage,
            hasMore: newMovies.length >= 20,
          ),
        );
      },
    );
  }

  void clear() {
    _cancelToken?.cancel();
    _cancelToken = null;
    state = AsyncData(SearchState.initial());
  }
}
