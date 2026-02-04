import 'package:flutter/material.dart';
import 'core/configs/app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    flavor: Flavor.prod,
    appName: "My App",
  );

  mainCommon(configuredApp);
}