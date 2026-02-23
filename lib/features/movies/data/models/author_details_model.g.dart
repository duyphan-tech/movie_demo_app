// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'author_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthorDetailsModel _$AuthorDetailsModelFromJson(Map<String, dynamic> json) =>
    _AuthorDetailsModel(
      name: json['name'] as String?,
      username: json['username'] as String?,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$AuthorDetailsModelToJson(_AuthorDetailsModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
