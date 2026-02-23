import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_details.freezed.dart';

@freezed
abstract class AuthorDetails with _$AuthorDetails {
  const factory AuthorDetails({
    String? name,
    String? username,
    String? avatarPath,
    double? rating,
  }) = _AuthorDetails;
}
