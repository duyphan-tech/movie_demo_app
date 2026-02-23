import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie.freezed.dart';

@freezed
abstract class Movie with _$Movie {
  const factory Movie({
    required int id,
    required String title,
    required String originalTitle,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required String releaseDate,
    required double voteAverage,
    double? rating,
    required int voteCount,
    required double popularity,
    required bool isAdult,
    required List<int> genreIds,
  }) = _Movie;
}
