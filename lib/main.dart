import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/configs/app_config.dart';
import 'my_app.dart';

Future<void> mainCommon(AppConfig config) async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp(config: config)));
}
