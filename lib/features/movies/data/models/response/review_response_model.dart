// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/data/models/review_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review_response.dart';

part 'review_response_model.freezed.dart';
part 'review_response_model.g.dart';

@freezed
abstract class ReviewResponseModel with _$ReviewResponseModel {
  const factory ReviewResponseModel({
    int? id,
    int? page,
    List<ReviewModel>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _ReviewResponseModel;

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseModelFromJson(json);
}

extension ReviewResponseModelX on ReviewResponseModel {
  ReviewResponse toDomain() {
    return ReviewResponse(
      id: id,
      page: page,
      results: results?.map((r) => r.toDomain()).toList(),
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
