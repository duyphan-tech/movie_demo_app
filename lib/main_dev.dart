import 'core/configs/app_config.dart';
import 'main.dart';

void main() {
  var configuredApp = AppConfig(flavor: Flavor.dev, appName: "My App (Dev)");

  mainCommon(configuredApp);
}
