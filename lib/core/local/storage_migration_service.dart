import 'package:movie_demo_app/core/local/storage_keys.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageMigrationService {
  final SharedPreferencesAsync _asyncPrefs = SharedPreferencesAsync();

  Future<void> migrate() async {
    final isMigrated =
        await _asyncPrefs.getBool(StorageKeys.kMigrationCompleteKey) ?? false;
    if (isMigrated) return;
    final legacyPrefs = await SharedPreferences.getInstance();
    final keys = legacyPrefs.getKeys();

    if (keys.isEmpty) {
      await _asyncPrefs.setBool(StorageKeys.kMigrationCompleteKey, true);
      return;
    }

    AppLogger.i('Starting migration for ${keys.length} items...', tag: 'StorageMigration');

    for (final key in keys) {
      if (key == StorageKeys.kMigrationCompleteKey) continue;

      final value = legacyPrefs.get(key);

      if (value is String) {
        await _asyncPrefs.setString(key, value);
      } else if (value is bool) {
        await _asyncPrefs.setBool(key, value);
      } else if (value is int) {
        await _asyncPrefs.setInt(key, value);
      } else if (value is double) {
        await _asyncPrefs.setDouble(key, value);
      } else if (value is List<String>) {
        await _asyncPrefs.setStringList(key, value);
      }
    }

    await _asyncPrefs.setBool(StorageKeys.kMigrationCompleteKey, true);
    await legacyPrefs.clear();
    AppLogger.i('Migration completed', tag: 'StorageMigration');
  }
}
