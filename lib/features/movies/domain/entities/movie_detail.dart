import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/genre.dart';

part 'movie_detail.freezed.dart';

@freezed
abstract class MovieDetail with _$MovieDetail {
  const factory MovieDetail({
    required int id,
    required String title,
    String? originalTitle,
    required String overview,
    String? posterPath,
    String? backdropPath,
    required String releaseDate,
    required double voteAverage,
    required int voteCount,
    required String status,
    String? tagline,
    required int runtime,
    required int budget,
    required int revenue,
    required List<Genre> genres,
  }) = _MovieDetail;
}
