import 'package:equatable/equatable.dart';
import 'package:movie_demo_app/features/movies/domain/entities/author_details.dart';

class Review extends Equatable {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final String? createdAt;
  final String? id;
  final String? updatedAt;
  final String? url;

  const Review({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  @override
  List<Object?> get props => [author, authorDetails, content, createdAt, id, updatedAt, url];
}