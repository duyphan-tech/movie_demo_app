import 'package:movie_demo_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({super.id, super.username, super.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int,
      username: json['username'] as String,
      token: json['accessToken'] as String,
    );
  }
  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username, 'accessToken': token};
  }
}
