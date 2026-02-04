import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource dataSource;

  AuthRepositoryImpl(this.dataSource);

  @override
  Future<String> login(String email, String password) async {
    try {
      final token = await dataSource.login(email, password);
      return token;
    } on Exception catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }

  @override
  Future<String> register(String email, String password) async {
    try {
      final token = await dataSource.register(email, password);
      return token;
    } on Exception catch (e) {
      throw Exception('Đăng ký thất bại: $e');
    }
  }
}
final authRepositoryProvider = Provider((ref) => AuthRepositoryImpl(ref.watch(authDataSourceProvider)));