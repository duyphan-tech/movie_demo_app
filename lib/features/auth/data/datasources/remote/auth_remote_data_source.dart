import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/network/endpoints.dart';

import '../../../../../core/constants/env_config.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/network/api_client.dart';
import '../../../../../core/network/dio_client.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, String>> login(String email, String password);

  Future<Either<Failure, String>> register(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient apiClient;

  AuthRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    final result = await apiClient.post(
      Endpoints.login,
      data: {'email': email, 'password': password},
    );
    return result.map((data) => data['token'] as String);
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
