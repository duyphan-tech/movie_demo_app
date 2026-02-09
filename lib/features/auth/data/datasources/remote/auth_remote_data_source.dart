import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/core/network/api_client.dart';
import 'package:movie_demo_app/core/network/endpoints.dart';
import 'package:movie_demo_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, UserModel>> login(String username, String password);

  Future<Either<Failure, String>> register(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Either<Failure, UserModel>> login(
    String username,
    String password,
  ) async {
    final result = await apiClient.post(
      Endpoints.login,
      data: {'username': username, 'password': password},
    );
    return result.map((data) => UserModel.fromJson(data));
  }

  @override
  Future<Either<Failure, String>> register(
    String email,
    String password,
  ) async {
    final result = await apiClient.post(
      Endpoints.register,
      data: {'email': email, 'password': password},
    );
    return result.map((data) => data['token'] as String);
  }
}
