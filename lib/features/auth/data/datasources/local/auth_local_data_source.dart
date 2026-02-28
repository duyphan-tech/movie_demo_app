import 'package:movie_demo_app/core/local/secure_storage_service.dart';
import 'package:movie_demo_app/core/local/storage_keys.dart';

/// Data source for authentication-related local storage operations.
///
/// Uses [SecureStorageService] for sensitive data (tokens).
class AuthLocalDataSource {
  final SecureStorageService _secureStorage;

  AuthLocalDataSource({
    required SecureStorageService secureStorage,
  }) : _secureStorage = secureStorage;

  Future<void> saveToken(String token) async {
    await _secureStorage.write(StorageKeys.tokenKey, token);
  }

  Future<String?> getToken() async {
    return await _secureStorage.read(StorageKeys.tokenKey);
  }

  Future<void> clearToken() async {
    await _secureStorage.delete(StorageKeys.tokenKey);
  }
}
