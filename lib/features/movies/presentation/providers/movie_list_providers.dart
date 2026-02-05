import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/entities/movie.dart';

part 'movie_list_providers.g.dart';

@riverpod
class NowPlayingMovies extends _$NowPlayingMovies {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    final result = await repo.getNowPlayingMovies();
    return result.fold((l) => [], (r) => r);
  }
}

@riverpod
class TopRatedMovies extends _$TopRatedMovies {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    final result = await repo.getTopRatedMovies();
    return result.fold((l) => [], (r) => r);
  }
}

@riverpod
class UpcomingMovies extends _$UpcomingMovies {
  @override
  Future<List<Movie>> build() async {
    final repo = ref.watch(movieRepositoryProvider);
    final result = await repo.getUpcomingMovies();
    return result.fold((l) => [], (r) => r);
  }
}

@riverpod
class PopularMovies extends _$PopularMovies {
  int _currentPage = 1;
  bool _hasMore = true;

  @override
  Future<List<Movie>> build() async {
    _currentPage = 1;
    _hasMore = true;
    return _fetchPage(1);
  }

  Future<List<Movie>> _fetchPage(int page) async {
    final repo = ref.read(movieRepositoryProvider);
    final result = await repo.getPopularMovies(page: page);
    return result.fold((l) => throw Exception(l.message), (r) {
      if (r.isEmpty) _hasMore = false;
      return r;
    });
  }

  Future<void> loadMore() async {
    if (state.isLoading || !_hasMore) return;

    state = const AsyncLoading<List<Movie>>().copyWithPrevious(state);
    try {
      final newMovies = await _fetchPage(_currentPage + 1);

      _currentPage++;

      final oldMovies = state.value ?? [];
      state = AsyncData([...oldMovies, ...newMovies]);
    } catch (e, st) {
      state = AsyncError<List<Movie>>(e, st).copyWithPrevious(state);
    }
  }
}
