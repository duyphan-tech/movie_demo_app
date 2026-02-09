import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  int _popularPage = 1;
  bool _hasMorePopular = true;

  @override
  Future<HomeState> build() async {
    _popularPage = 1;
    _hasMorePopular = true;
    final repo = ref.watch(movieRepositoryProvider);

    final results = await Future.wait([
      repo.getNowPlayingMovies(),
      repo.getTopRatedMovies(),
      repo.getUpcomingMovies(),
      repo.getPopularMovies(page: 1),
    ]);

    List<Movie> unwrap(dynamic result) {
      return result.fold((failure) => <Movie>[], (data) => data as List<Movie>);
    }

    return HomeState(
      nowPlaying: unwrap(results[0]),
      topRated: unwrap(results[1]),
      upcoming: unwrap(results[2]),
      popular: unwrap(results[3]),
    );
  }

  Future<void> loadMorePopular() async {
    if (state.isLoading || !_hasMorePopular) return;

    state = const AsyncLoading<HomeState>().copyWithPrevious(state);

    try {
      final repo = ref.read(movieRepositoryProvider);
      final nextPage = _popularPage + 1;

      final result = await repo.getPopularMovies(page: nextPage);

      result.fold((l) => state = AsyncError(l.message, StackTrace.current), (
        newMovies,
      ) {
        if (newMovies.isEmpty) {
          _hasMorePopular = false;
          state = AsyncData(state.value!);
          return;
        }

        _popularPage++;

        final currentState = state.value!;

        final newState = currentState.copyWith(
          popular: [...currentState.popular, ...newMovies],
        );

        state = AsyncData(newState);
      });
    } catch (e, st) {
      state = AsyncError<HomeState>(e, st).copyWithPrevious(state);
    }
  }
}
