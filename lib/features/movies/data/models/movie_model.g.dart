// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieModel _$MovieModelFromJson(Map<String, dynamic> json) => _MovieModel(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  originalTitle: json['original_title'] as String,
  overview: json['overview'] as String,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  releaseDate: json['release_date'] as String,
  voteAverage: (json['vote_average'] as num).toDouble(),
  rating: (json['rating'] as num?)?.toDouble(),
  voteCount: (json['vote_count'] as num).toInt(),
  popularity: (json['popularity'] as num).toDouble(),
  isAdult: json['adult'] as bool,
  genreIds: (json['genre_ids'] as List<dynamic>)
      .map((e) => (e as num).toInt())
      .toList(),
);

Map<String, dynamic> _$MovieModelToJson(_MovieModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'rating': instance.rating,
      'vote_count': instance.voteCount,
      'popularity': instance.popularity,
      'adult': instance.isAdult,
      'genre_ids': instance.genreIds,
    };
