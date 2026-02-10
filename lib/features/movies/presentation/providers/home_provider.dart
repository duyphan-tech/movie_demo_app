import 'package:movie_demo_app/core/providers/locale_provider.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_provider.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);

  int _popularPage = 1;
  bool _hasMorePopular = true;
  bool _isFetching = false;
  @override
  Future<HomeState> build() async {
    ref.watch(localeProvider);
    _popularPage = 1;
    _hasMorePopular = true;
    _isFetching = false;

    final results = await Future.wait([
      _movieRepo.getNowPlayingMovies(),
      _movieRepo.getTopRatedMovies(),
      _movieRepo.getUpcomingMovies(),
      _movieRepo.getPopularMovies(page: 1),
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
    if (_isFetching || !_hasMorePopular || state.isLoading) return;
    _isFetching = true;
    // ignore: invalid_use_of_internal_member
    state = const AsyncLoading<HomeState>().copyWithPrevious(state);

    try {
      final nextPage = _popularPage + 1;

      final result = await _movieRepo.getPopularMovies(page: nextPage);

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
      // ignore: invalid_use_of_internal_member
      state = AsyncError<HomeState>(e, st).copyWithPrevious(state);
    } finally {
      _isFetching = false;
    }
  }
}
