import 'package:movie_demo_app/core/local/local_storage_service.dart';
import 'package:movie_demo_app/core/local/storage_keys.dart';

class AuthLocalDataSource {
  final LocalStorageService localStorageService;

  AuthLocalDataSource(this.localStorageService);

  Future<void> saveToken(String token) async {
    await localStorageService.setString(StorageKeys.tokenKey, token);
  }

  Future<String?> getToken() async {
    return await localStorageService.getString(StorageKeys.tokenKey);
  }

  Future<void> clearToken() async {
    await localStorageService.remove(StorageKeys.tokenKey);
  }
}
