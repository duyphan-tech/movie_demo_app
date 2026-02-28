import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

class FavoriteNotifier extends Notifier<Set<int>> {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);
  final Map<int, CancelToken> _cancelTokens = {};
  @override
  Set<int> build() {
    Future.microtask(() => _loadInitialFavorites());
    return {};
  }

  bool isFavorite(int movieId) => state.contains(movieId);
  Future<void> _loadInitialFavorites() async {
    final result = await _movieRepo.getFavoriteMovies();

    result.fold(
      (failure) {
        AppLogger.e('Lỗi load favorites: ${failure.message}', tag: 'Favorite');
      },
      (movies) {
        final movieIds = movies.map((e) => e.id).toSet();
        state = movieIds;
        AppLogger.i('Đã load được ${movieIds.length} phim yêu thích từ Server', tag: 'Favorite');
      },
    );
  }

  Future<void> checkFavoriteStatus(int movieId) async {
    final result = await _movieRepo.getMovieAccountState(movieId);

    result.fold(
      (failure) {
        AppLogger.e('Lỗi sync status: ${failure.message}', tag: 'Favorite');
      },
      (accountState) {
        final bool isServerFavorite = accountState.favorite;
        final bool isLocalFavorite = state.contains(movieId);
        if (isServerFavorite && !isLocalFavorite) {
          state = {...state, movieId};
          AppLogger.i('Đã đồng bộ: Thêm $movieId vào yêu thích (từ Server)', tag: 'Favorite');
        } else if (!isServerFavorite && isLocalFavorite) {
          state = {...state}..remove(movieId);
          AppLogger.i('Đã đồng bộ: Xóa $movieId khỏi yêu thích (từ Server)', tag: 'Favorite');
        }
      },
    );
  }

  Future<void> toggleFavorite(int movieId) async {
    final bool isCurrentlyFavorite = state.contains(movieId);

    if (isCurrentlyFavorite) {
      state = {...state}..remove(movieId);
    } else {
      state = {...state, movieId};
    }

    if (isCurrentlyFavorite) {
      _cancelTokens[movieId]?.cancel("User toggled favorite too fast");
      _cancelTokens.remove(movieId);
      AppLogger.d('Đã huỷ request cũ cho movie: $movieId', tag: 'Favorite');
    }
    final cancelToken = CancelToken();
    _cancelTokens[movieId] = cancelToken;

    final result = await _movieRepo.markAsFavorite(
      movieId: movieId,
      isFavorite: !isCurrentlyFavorite,
      cancelToken: cancelToken,
    );

    result.fold(
      (failure) {
        if (failure.message != 'Request cancelled') {
          AppLogger.e('Lỗi API: ${failure.message} -> Revert UI', tag: 'Favorite');
          if (isCurrentlyFavorite) {
            state = {...state, movieId};
          } else {
            state = {...state}..remove(movieId);
          }
        } else {
          AppLogger.w('Request bị huỷ, giữ nguyên UI mới nhất', tag: 'Favorite');
        }
      },
      (success) {
        AppLogger.i('Đã update favorite cho movie $movieId thành công', tag: 'Favorite');
      },
    );

    if (_cancelTokens[movieId] == cancelToken) {
      _cancelTokens.remove(movieId);
    }
  }
}

final favoritesProvider = NotifierProvider<FavoriteNotifier, Set<int>>(
  () => FavoriteNotifier(),
);
