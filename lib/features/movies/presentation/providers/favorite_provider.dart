import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

class FavoriteNotifier extends Notifier<Set<int>> {
  @override
  Set<int> build() => {};

  bool isFavorite(int movieId) => state.contains(movieId);

  Future<void> toggleFavorite(int movieId) async {
    final bool isCurrentlyFavorite = state.contains(movieId);
    final repo = ref.read(movieRepositoryProvider);

    if (isCurrentlyFavorite) {
      state = {...state}..remove(movieId);
    } else {
      state = {...state, movieId};
    }

    final result = await repo.markAsFavorite(
      movieId: movieId,
      isFavorite: !isCurrentlyFavorite,
    );

    result.fold(
      (failure) {
        if (isCurrentlyFavorite) {
          state = {...state, movieId};
        } else {
          state = {...state}..remove(movieId);
        }
      },
      (success) {
        print("Đã update favorite cho movie $movieId thành công");
      },
    );
  }
}

final favoritesProvider = NotifierProvider<FavoriteNotifier, Set<int>>(
  () => FavoriteNotifier(),
);
