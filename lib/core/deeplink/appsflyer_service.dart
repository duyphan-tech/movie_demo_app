import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';

class AppsFlyerService {
  late AppsflyerSdk _appsflyerSdk;
  final GoRouter _router;
  // AppsFlyer Dev Key (Lấy trong Dashboard -> App Settings)
  static const String _afDevKey = 'YOUR_DEV_KEY_HERE';
  static const String _appIdIOS = '123456789'; // ID trên App Store (chỉ số)
  // Android không cần App ID config ở đây, nó tự lấy package name
  AppsFlyerService({required GoRouter router}) : _router = router;

  Future<void> init() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: _afDevKey,
      appId: _appIdIOS,
      showDebug: kDebugMode,
      timeToWaitForATTUserAuthorization: 50, // Cho iOS 14+
      disableAdvertisingIdentifier: false,
    );

    _appsflyerSdk = AppsflyerSdk(options);

    // --- QUAN TRỌNG: LẮNG NGHE ONELINK ---
    _appsflyerSdk.onDeepLinking((DeepLinkResult res) {
      if (res.status == Status.FOUND) {
        final deepLinkObj = res.deepLink;

        // 1. Lấy Deep Link Value (Ví dụ: "product/123")
        // Đây là chuẩn UDL (Unified Deep Linking)
        String? deepLinkValue = deepLinkObj?.deepLinkValue;

        logger.printLog('i', "AppsFlyer: DeepLinkValue = $deepLinkValue");

        if (deepLinkValue != null && deepLinkValue.isNotEmpty) {
          _handleNavigation(deepLinkValue);
        }
      } else {
        logger.printLog(
          'e',
          "AppsFlyer: Deep link not found or error: ${res.error}",
        );
      }
    });

    // Khởi động SDK
    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true, // Legacy (để backup)
      registerOnDeepLinkingCallback: true, // UDL (Quan trọng nhất)
    );
  }

  void _handleNavigation(String deepLinkValue) {
    // deepLinkValue nhận được từ dashboard là "product/123"
    // GoRouter cần path bắt đầu bằng "/" -> "/product/123"

    final targetPath = deepLinkValue.startsWith('/')
        ? deepLinkValue
        : '/$deepLinkValue';

    logger.printLog('i', "AppsFlyer: Navigating to $targetPath");

    // Điều hướng ngay lập tức
    _router.go(targetPath);
  }
}
