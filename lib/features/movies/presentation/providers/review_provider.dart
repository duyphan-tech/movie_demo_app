import 'dart:async';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';
import 'package:movie_demo_app/features/movies/domain/repositories/movie_repository.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'review_provider.g.dart';

@riverpod
class ReviewNotifier extends _$ReviewNotifier {
  MovieRepository get _movieRepo => ref.read(movieRepositoryProvider);

  @override
  Future<List<Review>> build(int movieId) async {
    final result = await _movieRepo.getMovieReviews(movieId);

    return result.fold((failure) => [], (reviews) => reviews);
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => build(movieId));
  }
}
