import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/features/auth/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/local/auth_local_data_source.dart';
import '../datasources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    final result = await remoteDataSource.login(username, password);
    return result;
  }

  @override
  Future<Either<Failure, String>> register(
    String email,
    String password,
  ) async {
    final result = await remoteDataSource.register(email, password);
    return result.map((token) {
      // localDataSource.saveToken(token);
      return token;
    });
  }

  @override
  Future<void> logout() async {
    await localDataSource.clearToken();
  }

  @override
  Future<String?> getSavedToken() async {
    return await localDataSource.getToken();
  }

  @override
  Future<void> saveToken(String token) async {
    await localDataSource.saveToken(token);
  }
}
