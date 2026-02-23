import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/author_details.dart';

part 'author_details_model.freezed.dart';
part 'author_details_model.g.dart';

@freezed
abstract class AuthorDetailsModel with _$AuthorDetailsModel {
  const factory AuthorDetailsModel({
    String? name,
    String? username,
    @JsonKey(name: 'avatar_path') String? avatarPath,
    double? rating,
  }) = _AuthorDetailsModel;

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$AuthorDetailsModelFromJson(json);
}

extension AuthorDetailsModelX on AuthorDetailsModel {
  AuthorDetails toDomain() {
    return AuthorDetails(
      name: name,
      username: username,
      avatarPath: avatarPath,
      rating: rating,
    );
  }
}
