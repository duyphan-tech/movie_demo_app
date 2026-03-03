import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';
import 'package:movie_demo_app/providers/deep_link_stream_provider.dart';

import 'core/logger/app_logger.dart';
import 'flavors.dart';
import 'my_app.dart';
import 'core/configs/app_config.dart';

void main() {
  F.appFlavor = _getFlavorFromBundleId();
  AppLogger.i('AppFlavor: ${F.appFlavor}', tag: 'Main');

  final config = AppConfig(flavor: F.appFlavor, appName: F.title);

  mainCommon(config);
}

Flavor _getFlavorFromBundleId() {
  const bundleId = String.fromEnvironment('PRODUCT_BUNDLE_IDENTIFIER');
  AppLogger.i('Bundle ID: $bundleId', tag: 'Main');

  if (bundleId.contains('.dev')) return Flavor.dev;
  if (bundleId.contains('.staging')) return Flavor.staging;
  return Flavor.prod;
}

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [appConfigProvider.overrideWithValue(config)],
  );

  try {
    await container.read(appInitializationProvider.future);

    final pendingDeepLinkNotifier = container.read(
      pendingDeepLinkProvider.notifier,
    );
    await pendingDeepLinkNotifier.initializeAndCheckDeepLink();

    container.read(deepLinkStreamProvider);

    container.read(appsFlyerInitializerProvider.future).catchError((e) {
      AppLogger.e('AppsFlyer Init Error', tag: 'Main', error: e);
    });
  } catch (e) {
    AppLogger.e('Initialization error', tag: 'Main', error: e);
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(config: config),
    ),
  );
}
