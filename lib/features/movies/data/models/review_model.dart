// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/data/models/author_details_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
abstract class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    String? author,
    @JsonKey(name: 'author_details') AuthorDetailsModel? authorDetails,
    String? content,
    @JsonKey(name: 'created_at') String? createdAt,
    String? id,
    @JsonKey(name: 'updated_at') String? updatedAt,
    String? url,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

extension ReviewModelX on ReviewModel {
  Review toDomain() {
    return Review(
      author: author,
      authorDetails: authorDetails?.toDomain(),
      content: content,
      createdAt: createdAt,
      id: id,
      updatedAt: updatedAt,
      url: url,
    );
  }
}
