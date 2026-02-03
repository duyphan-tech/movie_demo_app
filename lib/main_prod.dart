import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(
    flavor: Flavor.prod,
    appName: "My App",
    apiBaseUrl: "https://api.com",
  );

  mainCommon(configuredApp);
}