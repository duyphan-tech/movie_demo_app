import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/local/local_storage_service.dart';
import 'package:movie_demo_app/core/local/secure_storage_service.dart';
import 'package:movie_demo_app/core/local/storage_migration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});
final sharedPreferencesAsyncProvider = Provider<SharedPreferencesAsync>((ref) {
  return SharedPreferencesAsync();
});

final localStorageProvider = Provider<LocalStorageService>((ref) {
  return LocalStorageService(ref.watch(sharedPreferencesAsyncProvider));
});

final storageMigrationProvider = Provider<StorageMigrationService>((ref) {
  return StorageMigrationService();
});

final _flutterSecureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  return const FlutterSecureStorage();
});

final secureStorageProvider = Provider<SecureStorageService>((ref) {
  return SecureStorageService(ref.watch(_flutterSecureStorageProvider));
});

final appInitializationProvider = FutureProvider<void>((ref) async {
  final migrationService = ref.read(storageMigrationProvider);
  await migrationService.migrate();
});
