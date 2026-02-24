// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => _VideoModel(
  id: json['id'] as String,
  name: json['name'] as String,
  key: json['key'] as String,
  site: json['site'] as String,
  type: json['type'] as String,
  official: json['official'] as bool,
  publishedAt: json['published_at'] as String,
  iso6391: json['iso_639_1'] as String,
  iso31661: json['iso_3166_1'] as String,
  size: (json['size'] as num).toInt(),
);

Map<String, dynamic> _$VideoModelToJson(_VideoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'key': instance.key,
      'site': instance.site,
      'type': instance.type,
      'official': instance.official,
      'published_at': instance.publishedAt,
      'iso_639_1': instance.iso6391,
      'iso_3166_1': instance.iso31661,
      'size': instance.size,
    };

_VideoResponseModel _$VideoResponseModelFromJson(Map<String, dynamic> json) =>
    _VideoResponseModel(
      id: (json['id'] as num).toInt(),
      results: (json['results'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoResponseModelToJson(_VideoResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'results': instance.results.map((e) => e.toJson()).toList(),
    };
