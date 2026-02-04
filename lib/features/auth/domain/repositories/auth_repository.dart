import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> login(String email, String password);

  Future<Either<Failure, String>> register(String email, String password);

  Future<void> logout();

  Future<String?> getSavedToken();
}
