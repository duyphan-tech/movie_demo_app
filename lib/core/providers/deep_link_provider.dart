import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/deeplink/appsflyer_service.dart';
import 'package:movie_demo_app/core/router/app_router.dart';

final appsFlyerServiceProvider = Provider<AppsFlyerService>((ref) {
  final router = ref.watch(routerProvider);
  return AppsFlyerService(router: router);
});

final appsFlyerInitializerProvider = FutureProvider<void>((ref) async {
  final service = ref.read(appsFlyerServiceProvider);

  await service.init();
});
