import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:movie_demo_app/core/local/storage_migration_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Test migration from Legacy to Async', (
    WidgetTester tester,
  ) async {
    const testKey = 'integration_test_key';
    const testValue = 'Hello from Legacy';

    // --- BƯỚC 1: Setup dữ liệu cũ ---
    final legacyPrefs = await SharedPreferences.getInstance();
    // Đảm bảo sạch sẽ trước khi test
    await legacyPrefs.clear();
    final asyncPrefs = SharedPreferencesAsync();
    await asyncPrefs.clear();

    // Ghi dữ liệu bằng API cũ
    await legacyPrefs.setString(testKey, testValue);

    // Verify là API mới chưa có dữ liệu (nếu khác file)
    // hoặc chưa chạy migration logic
    // (Bước này tuỳ thuộc vào việc bạn có dùng chung file hay không,
    // nhưng cứ giả định là ta cần verify sau khi chạy service)

    // --- BƯỚC 2: Chạy Migration ---
    final migrationService = StorageMigrationService();
    await migrationService.migrate();

    // --- BƯỚC 3: Verify kết quả ---
    final result = await asyncPrefs.getString(testKey);

    // Kiểm tra dữ liệu đã sang API mới chưa
    expect(result, equals(testValue));

    // Kiểm tra cờ đánh dấu đã hoàn tất
    final isMigrated = await asyncPrefs.getBool(
      'migration_completed_v1',
    ); // Key trong service của bạn
    expect(isMigrated, true);
  });
}
