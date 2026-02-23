// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReviewResponseModel _$ReviewResponseModelFromJson(Map<String, dynamic> json) =>
    _ReviewResponseModel(
      id: (json['id'] as num?)?.toInt(),
      page: (json['page'] as num?)?.toInt(),
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalPages: (json['total_pages'] as num?)?.toInt(),
      totalResults: (json['total_results'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ReviewResponseModelToJson(
  _ReviewResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'page': instance.page,
  'results': instance.results?.map((e) => e.toJson()).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};
