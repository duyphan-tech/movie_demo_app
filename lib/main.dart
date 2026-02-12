import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';

import 'core/configs/app_config.dart';
import 'my_app.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  try {
    await container.read(appInitializationProvider.future);
  } catch (e) {
    debugPrint('Migration error $e');
  }
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MyApp(config: config),
    ),
  );
}
