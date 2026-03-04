import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:movie_demo_app/core/errors/exceptions.dart';

/// Service for storing sensitive data securely using flutter_secure_storage.
///
/// This service stores data in:
/// - iOS: Keychain
/// - Android: Keystore (encrypted SharedPreferences)
/// - Web: LocalStorage (base64 encoded - not truly secure)
class SecureStorageService {
  final FlutterSecureStorage _storage;

  static const _iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );

  static const _androidOptions = AndroidOptions(
    encryptedSharedPreferences: true,
  );

  const SecureStorageService(this._storage);

  Future<String?> read(String key) async {
    try {
      return await _storage.read(
        key: key,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to read secure data: $e');
    }
  }

  Future<void> write(String key, String value) async {
    try {
      await _storage.write(
        key: key,
        value: value,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to write secure data: $e');
    }
  }

  Future<void> delete(String key) async {
    try {
      await _storage.delete(
        key: key,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to delete secure data: $e');
    }
  }

  Future<void> deleteAll() async {
    try {
      await _storage.deleteAll(
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to clear secure data: $e');
    }
  }

  Future<bool> containsKey(String key) async {
    try {
      return await _storage.containsKey(
        key: key,
        iOptions: _iosOptions,
        aOptions: _androidOptions,
      );
    } catch (e) {
      throw CacheException(message: 'Failed to check secure key: $e');
    }
  }
}
