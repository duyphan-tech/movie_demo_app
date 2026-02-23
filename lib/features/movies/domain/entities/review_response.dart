import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

part 'review_response.freezed.dart';

@freezed
abstract class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    int? id,
    int? page,
    List<Review>? results,
    @JsonKey(name: 'total_pages') int? totalPages,
    @JsonKey(name: 'total_results') int? totalResults,
  }) = _ReviewResponse;
}
