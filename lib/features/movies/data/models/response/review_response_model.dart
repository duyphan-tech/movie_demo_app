import 'package:movie_demo_app/features/movies/data/models/review_model.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review_response.dart';

class ReviewResponseModel extends ReviewResponse {
  const ReviewResponseModel({
    super.id,
    super.page,
    super.results,
    super.totalPages,
    super.totalResults,
  });

  factory ReviewResponseModel.fromJson(Map<String, dynamic> json) {
    return ReviewResponseModel(
      id: json['id'],
      page: json['page'],
      results: json['results'] != null
          ? (json['results'] as List).map((i) => ReviewModel.fromJson(i)).toList()
          : null,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}