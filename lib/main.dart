import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/deep_link_stream_provider.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';

import 'core/configs/app_config.dart';
import 'my_app.dart';

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
      logger.printLog('e', 'AppsFlyer Init Error: $e');
    });
  } catch (e) {
    logger.printLog('e', 'Initialization error: $e');
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(config: config),
    ),
  );
}
