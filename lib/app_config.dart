enum Flavor { dev, prod }

class AppConfig {
  final Flavor flavor;
  final String appName;
  final String apiBaseUrl;

  AppConfig({required this.flavor, required this.appName, required this.apiBaseUrl});
}