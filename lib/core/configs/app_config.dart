import 'package:movie_demo_app/flavors.dart';

class DeepLinkConfig {
  final String scheme;
  final String? host;
  final bool useHttps;

  const DeepLinkConfig({
    required this.scheme,
    this.host,
    this.useHttps = false,
  });

  static const DeepLinkConfig dev = DeepLinkConfig(
    scheme: 'moviedemodev',
    host: 'details',
  );

  static const DeepLinkConfig staging = DeepLinkConfig(
    scheme: 'moviedemostaging',
    host: 'details',
  );

  static const DeepLinkConfig prod = DeepLinkConfig(
    scheme: 'moviedemo',
    host: 'details',
  );

  static DeepLinkConfig fromFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        return dev;
      case Flavor.staging:
        return staging;
      case Flavor.prod:
        return prod;
    }
  }
}

class AppConfig {
  final Flavor flavor;
  final String appName;
  final DeepLinkConfig deepLinkConfig;

  AppConfig({
    required this.flavor,
    required this.appName,
    DeepLinkConfig? deepLinkConfig,
  }) : deepLinkConfig = deepLinkConfig ?? DeepLinkConfig.fromFlavor(flavor);

  bool isValidDeepLink(Uri uri) {
    if (useHttps) {
      return uri.scheme == 'https' && uri.host == deepLinkConfig.host;
    }
    return uri.scheme == deepLinkConfig.scheme &&
        (deepLinkConfig.host == null || uri.host == deepLinkConfig.host);
  }

  bool get useHttps => deepLinkConfig.useHttps;
  String get scheme => deepLinkConfig.scheme;
}
