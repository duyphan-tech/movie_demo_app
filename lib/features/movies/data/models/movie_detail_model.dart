import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/data/models/genre_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

part 'movie_detail_model.freezed.dart';
part 'movie_detail_model.g.dart';

@freezed
abstract class MovieDetailModel with _$MovieDetailModel {
  const factory MovieDetailModel({
    required int id,
    required String title,
    @JsonKey(name: 'original_title') String? originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
    @JsonKey(name: 'vote_count') required int voteCount,
    required String status,
    String? tagline,
    required int runtime,
    required int budget,
    required int revenue,
    required List<GenreModel> genres,
  }) = _MovieDetailModel;

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);
}

extension MovieDetailModelX on MovieDetailModel {
  MovieDetail toDomain() {
    return MovieDetail(
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
      status: status,
      tagline: tagline,
      runtime: runtime,
      budget: budget,
      revenue: revenue,
      genres: genres.map((g) => g.toDomain()).toList(),
    );
  }
}
