import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/deeplink/appsflyer_service.dart';
import 'package:movie_demo_app/core/router/app_router.dart';

/// Provider to initialize AppsFlyer SDK
/// Returns true if initialization was successful
final appsFlyerInitializerProvider = FutureProvider<bool>((ref) async {
  final router = ref.read(routerProvider);
  final appsFlyerService = AppsFlyerService(router: router);

  await appsFlyerService.init();

  return true;
});
