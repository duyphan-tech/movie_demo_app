import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants/env_config.dart';
import '../../../../core/network/dio_client.dart';

class AuthRemoteDataSource {
  final Dio dio;
  AuthRemoteDataSource(this.dio);

  final baseUrl = EnvConfig.reqresUrl;

  Future<String> login(String email, String password) async {
    final response = await dio.post(
      '$baseUrl/login',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response.data['token'];
  }

  Future<String> register(String email, String password) async {
    final response = await dio.post(
      '$baseUrl/register',
      data: {
        'email': email,
        'password': password,
      },
    );
    return response.data['token'];
  }
}
final authDataSourceProvider = Provider((ref) => AuthRemoteDataSource(ref.watch(basicDioProvider)));
