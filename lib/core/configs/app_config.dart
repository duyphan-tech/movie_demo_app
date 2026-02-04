enum Flavor { dev, prod }

class AppConfig {
  final Flavor flavor;
  final String appName;

  AppConfig({required this.flavor, required this.appName});
}