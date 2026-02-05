import 'package:equatable/equatable.dart';
import 'package:movie_demo_app/features/movies/domain/entities/review.dart';

class ReviewResponse extends Equatable {
  final int? id;
  final int? page;
  final List<Review>? results;
  final int? totalPages;
  final int? totalResults;

  const ReviewResponse({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  @override
  List<Object?> get props => [id, page, results, totalPages, totalResults];
}