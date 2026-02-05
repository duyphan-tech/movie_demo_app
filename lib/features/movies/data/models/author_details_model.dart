import 'package:movie_demo_app/features/movies/domain/entities/author_details.dart';

class AuthorDetailsModel extends AuthorDetails {
  const AuthorDetailsModel({
    super.name,
    super.username,
    super.avatarPath,
    super.rating,
  });

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) {
    return AuthorDetailsModel(
      name: json['name'],
      username: json['username'],
      avatarPath: json['avatar_path'],
      rating: json['rating']?.toDouble(),
    );
  }
}