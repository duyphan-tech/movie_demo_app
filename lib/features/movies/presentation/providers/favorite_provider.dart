import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
        debugPrint("Lỗi load favorites: ${failure.message}");
      },
      (movies) {
        final movieIds = movies.map((e) => e.id).toSet();
        state = movieIds;
        debugPrint("Đã load được ${movieIds.length} phim yêu thích từ Server");
      },
    );
  }

  Future<void> checkFavoriteStatus(int movieId) async {
    final result = await _movieRepo.getMovieAccountState(movieId);

    result.fold(
      (failure) {
        debugPrint("Lỗi sync status: ${failure.message}");
      },
      (accountState) {
        final bool isServerFavorite = accountState.favorite;
        final bool isLocalFavorite = state.contains(movieId);
        if (isServerFavorite && !isLocalFavorite) {
          state = {...state, movieId};
          debugPrint("Đã đồng bộ: Thêm $movieId vào yêu thích (từ Server)");
        } else if (!isServerFavorite && isLocalFavorite) {
          state = {...state}..remove(movieId);
          debugPrint("Đã đồng bộ: Xóa $movieId khỏi yêu thích (từ Server)");
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
      debugPrint("🚫 Đã huỷ request cũ cho movie: $movieId");
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
          debugPrint("❌ Lỗi API: ${failure.message} -> Revert UI");
          if (isCurrentlyFavorite) {
            state = {...state, movieId};
          } else {
            state = {...state}..remove(movieId);
          }
        } else {
          debugPrint("⚠️ Request bị huỷ, giữ nguyên UI mới nhất.");
        }
      },
      (success) {
        debugPrint("Đã update favorite cho movie $movieId thành công");
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
