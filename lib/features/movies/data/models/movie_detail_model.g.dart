// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) =>
    _MovieDetailModel(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      originalTitle: json['original_title'] as String?,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      releaseDate: json['release_date'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: (json['vote_count'] as num).toInt(),
      status: json['status'] as String,
      tagline: json['tagline'] as String?,
      runtime: (json['runtime'] as num).toInt(),
      budget: (json['budget'] as num).toInt(),
      revenue: (json['revenue'] as num).toInt(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => GenreModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MovieDetailModelToJson(_MovieDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'poster_path': instance.posterPath,
      'backdrop_path': instance.backdropPath,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
      'status': instance.status,
      'tagline': instance.tagline,
      'runtime': instance.runtime,
      'budget': instance.budget,
      'revenue': instance.revenue,
      'genres': instance.genres.map((e) => e.toJson()).toList(),
    };
