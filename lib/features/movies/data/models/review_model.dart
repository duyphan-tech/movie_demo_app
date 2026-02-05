import 'package:movie_demo_app/features/movies/data/models/author_details_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

class ReviewModel extends Review {
  const ReviewModel({
    super.author,
    super.authorDetails,
    super.content,
    super.createdAt,
    super.id,
    super.updatedAt,
    super.url,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      author: json['author'],
      authorDetails: json['author_details'] != null
          ? AuthorDetailsModel.fromJson(json['author_details'])
          : null,
      content: json['content'],
      createdAt: json['created_at'],
      id: json['id'],
      updatedAt: json['updated_at'],
      url: json['url'],
    );
  }
}