import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDataSource {
  final SharedPreferencesAsync _prefs = SharedPreferencesAsync();
  static const _tokenKey = 'USER_TOKEN';

  AuthLocalDataSource();

  Future<void> saveToken(String token) async {
    await _prefs.setString(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return await _prefs.getString(_tokenKey);
  }

  Future<void> clearToken() async {
    await _prefs.remove(_tokenKey);
  }
}
