import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/author_details.dart';

part 'review.freezed.dart';

@freezed
abstract class Review with _$Review {
  const factory Review({
    String? author,
    AuthorDetails? authorDetails,
    String? content,
    String? createdAt,
    String? id,
    String? updatedAt,
    String? url,
  }) = _Review;
}
