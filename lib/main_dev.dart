import 'package:flutter/material.dart';
import 'app_config.dart';
import 'main.dart'; // File main gốc của bạn

void main() {
  var configuredApp = AppConfig(
    flavor: Flavor.dev,
    appName: "My App (Dev)",
    apiBaseUrl: "https://dev.api.com",
  );

  mainCommon(configuredApp);
}