import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';

part 'movie_model.freezed.dart';
part 'movie_model.g.dart';

@freezed
abstract class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    @JsonKey(name: 'original_title') required String originalTitle,
    required String overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    @JsonKey(name: 'release_date') required String releaseDate,
    @JsonKey(name: 'vote_average') required double voteAverage,
    double? rating,
    @JsonKey(name: 'vote_count') required int voteCount,
    required double popularity,
    @JsonKey(name: 'adult') required bool isAdult,
    @JsonKey(name: 'genre_ids') required List<int> genreIds,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);
}

// Extension for conversion to domain entity
extension MovieModelX on MovieModel {
  Movie toDomain() {
    return Movie(
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      backdropPath: backdropPath,
      releaseDate: releaseDate,
      voteAverage: voteAverage,
      rating: rating,
      voteCount: voteCount,
      popularity: popularity,
      isAdult: isAdult,
      genreIds: genreIds,
    );
  }
}
