import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flavors.dart';
import 'my_app.dart';
import 'core/configs/app_config.dart';

void main() {
  F.appFlavor = Flavor.values.firstWhere(
    (element) => element.name == appFlavor,
    orElse: () => Flavor.dev, // Fallback khi chạy từ IDE không có --flavor
  );

  final config = AppConfig(
    flavor: F.appFlavor,
    appName: F.title,
  );

  runApp(ProviderScope(child: MyApp(config: config)));
}
