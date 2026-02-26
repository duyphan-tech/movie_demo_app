import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/core/errors/exceptions.dart';
import 'package:movie_demo_app/core/errors/failures.dart';
import 'package:movie_demo_app/features/auth/data/datasources/local/auth_local_data_source.dart';
import 'package:movie_demo_app/features/auth/data/datasources/remote/auth_remote_data_source.dart';
import 'package:movie_demo_app/features/auth/data/models/user_model.dart';
import 'package:movie_demo_app/features/auth/domain/entities/user.dart';
import 'package:movie_demo_app/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl(this.remoteDataSource, this.localDataSource);

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    final result = await remoteDataSource.login(username, password);
    return result.map((model) => model.toDomain());
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
  Future<Either<Failure, void>> logout() async {
    try {
      await localDataSource.clearToken();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to logout: $e'));
    }
  }

  @override
  Future<Either<Failure, String?>> getSavedToken() async {
    try {
      final token = await localDataSource.getToken();
      return Right(token);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to get token: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> saveToken(String token) async {
    try {
      await localDataSource.saveToken(token);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message));
    } catch (e) {
      return Left(CacheFailure(message: 'Failed to save token: $e'));
    }
  }
}
