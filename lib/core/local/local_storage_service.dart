import 'dart:convert';

import 'package:movie_demo_app/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageService {
  final SharedPreferencesAsync _prefs;

  LocalStorageService(this._prefs);

  Future<String?> getString(String key) async {
    try {
      return await _prefs.getString(key);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  Future<bool?> getBool(String key) async {
    try {
      return await _prefs.getBool(key);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  Future<int?> getInt(String key) async {
    try {
      return await _prefs.getInt(key);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  Future<double?> getDouble(String key) async {
    try {
      return await _prefs.getDouble(key);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  Future<List<String>?> getStringList(String key) async {
    try {
      return await _prefs.getStringList(key);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  // --- SETTERS (Phải chuyển return type thành void) ---

  Future<void> setString(String key, String value) async {
    try {
      await _prefs.setString(key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  Future<void> setBool(String key, bool value) async {
    try {
      await _prefs.setBool(key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  Future<void> setInt(String key, int value) async {
    try {
      await _prefs.setInt(key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  Future<void> setDouble(String key, double value) async {
    try {
      await _prefs.setDouble(key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  Future<void> setStringList(String key, List<String> value) async {
    try {
      await _prefs.setStringList(key, value);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  // --- OBJECT & UTILS ---

  Future<void> setObject(String key, Object value) async {
    try {
      final String jsonString = json.encode(value);
      await _prefs.setString(key, jsonString);
    } catch (e) {
      throw CacheException(message: 'Failed to save data: $e');
    }
  }

  // getObject cũng phải là Future
  Future<dynamic> getObject(String key) async {
    try {
      // Phải await ở đây
      final String? jsonString = await _prefs.getString(key);
      if (jsonString == null) return null;
      return json.decode(jsonString);
    } catch (e) {
      throw CacheException(message: 'Failed to retrieve data: $e');
    }
  }

  // containsKey cũng trả về Future<bool>
  Future<bool> hasKey(String key) async {
    try {
      return await _prefs.containsKey(key);
    } catch (e) {
      throw CacheException(message: 'Failed to check key: $e');
    }
  }

  Future<void> remove(String key) async {
    try {
      await _prefs.remove(key);
    } catch (e) {
      throw CacheException(message: 'Failed to remove data: $e');
    }
  }

  Future<void> clear() async {
    try {
      await _prefs.clear();
    } catch (e) {
      throw CacheException(message: 'Failed to clear data: $e');
    }
  }
}
