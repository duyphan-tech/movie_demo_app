import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../logger/app_logger.dart';

class SecureStorageHelper {
  static const FlutterSecureStorage instance = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
    iOptions: IOSOptions(
      accountName: 'flutter_secure_storage',
      accessibility: KeychainAccessibility.first_unlock_this_device,
    ),
  );

  static const String _firstLaunchKey = 'is_first_launch_v1';

  /// Initialize secure storage
  /// Should be called before accessing any secure storage data
  static Future<void> initialize() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isFirstLaunch = prefs.getBool(_firstLaunchKey) ?? true;

      if (isFirstLaunch) {
        AppLogger.i(
          'First launch detected - clearing old secure storage',
          tag: 'SecureStorage',
        );

        // Clear all secure storage data
        await instance.deleteAll();

        // Mark as not first launch
        await prefs.setBool(_firstLaunchKey, false);

        AppLogger.i(
          'Secure storage cleared successfully',
          tag: 'SecureStorage',
        );
      } else {
        AppLogger.d(
          'Not first launch - using existing secure storage',
          tag: 'SecureStorage',
        );
      }
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error initializing secure storage',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Force clear all secure storage (useful for logout)
  static Future<void> clearAll() async {
    try {
      await SecureStorageHelper.instance.deleteAll();
      AppLogger.i('All secure storage data cleared', tag: 'SecureStorage');
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error clearing secure storage',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Read a value from secure storage
  static Future<String?> read(String key) async {
    try {
      return await SecureStorageHelper.instance.read(key: key);
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error reading from secure storage: $key',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  /// Write a value to secure storage
  static Future<void> write(String key, String value) async {
    try {
      await SecureStorageHelper.instance.write(key: key, value: value);
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error writing to secure storage: $key',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Delete a specific key from secure storage
  static Future<void> delete(String key) async {
    try {
      await SecureStorageHelper.instance.delete(key: key);
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error deleting from secure storage: $key',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }

  /// Check if a key exists in secure storage
  static Future<bool> containsKey(String key) async {
    try {
      return await SecureStorageHelper.instance.containsKey(key: key);
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error checking secure storage: $key',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
      return false;
    }
  }

  /// Get all keys in secure storage
  static Future<Set<String>> getAllKeys() async {
    try {
      final allData = await SecureStorageHelper.instance.readAll();
      return allData.keys.toSet();
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error reading all keys from secure storage',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
      return {};
    }
  }

  /// Reset first launch flag (useful for testing)
  static Future<void> resetFirstLaunchFlag() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool(_firstLaunchKey, true);
      AppLogger.i('First launch flag reset', tag: 'SecureStorage');
    } catch (e, stackTrace) {
      AppLogger.e(
        'Error resetting first launch flag',
        tag: 'SecureStorage',
        error: e,
        stackTrace: stackTrace,
      );
    }
  }
}
