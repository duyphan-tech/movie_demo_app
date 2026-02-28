import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';

class AppsFlyerService {
  late AppsflyerSdk _appsflyerSdk;
  final GoRouter _router;
  static const String _afDevKey = 'YOUR_DEV_KEY_HERE';
  static const String _appIdIOS = '123456789';
  AppsFlyerService({required GoRouter router}) : _router = router;

  Future<void> init() async {
    final AppsFlyerOptions options = AppsFlyerOptions(
      afDevKey: _afDevKey,
      appId: _appIdIOS,
      showDebug: kDebugMode,
      timeToWaitForATTUserAuthorization: 50,
      disableAdvertisingIdentifier: false,
    );

    _appsflyerSdk = AppsflyerSdk(options);

    _appsflyerSdk.onDeepLinking((DeepLinkResult res) {
      if (res.status == Status.FOUND) {
        final deepLinkObj = res.deepLink;
        String? deepLinkValue = deepLinkObj?.deepLinkValue;

        AppLogger.i('AppsFlyer: DeepLinkValue = $deepLinkValue', tag: 'AppsFlyer');

        if (deepLinkValue != null && deepLinkValue.isNotEmpty) {
          _handleNavigation(deepLinkValue);
        }
      } else {
        AppLogger.e(
          'AppsFlyer: Deep link not found or error',
          tag: 'AppsFlyer',
          error: res.error,
        );
      }
    });

    await _appsflyerSdk.initSdk(
      registerConversionDataCallback: true,
      registerOnAppOpenAttributionCallback: true,
      registerOnDeepLinkingCallback: true,
    );
  }

  void _handleNavigation(String deepLinkValue) {
    if (deepLinkValue.startsWith('moviedemo')) {
      AppLogger.i('Ignoring custom scheme, let GoRouter handle it', tag: 'AppsFlyer');
      return;
    }

    final targetPath = deepLinkValue.startsWith('/')
        ? deepLinkValue
        : '/$deepLinkValue';

    AppLogger.i('Navigating to $targetPath', tag: 'AppsFlyer');

    _router.go(targetPath);
  }
}
