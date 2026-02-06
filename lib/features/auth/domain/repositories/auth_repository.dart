import 'package:fpdart/fpdart.dart';
import 'package:movie_demo_app/features/auth/domain/entities/user.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, String>> register(String email, String password);

  Future<void> logout();

  Future<String?> getSavedToken();
  Future<void> saveToken(String token);
}
