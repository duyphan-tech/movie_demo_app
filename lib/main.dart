import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';

import 'core/configs/app_config.dart';
import 'my_app.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  try {
    await container.read(appInitializationProvider.future);
    container.read(appsFlyerInitializerProvider.future).catchError((e) {
      logger.printLog('e', 'AppsFlyer Init Error: $e');
    });
  } catch (e) {
    logger.printLog('e', 'Migration error $e');
  }
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(config: config),
    ),
  );
}
