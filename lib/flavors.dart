enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static late final Flavor appFlavor;

  static String get name => appFlavor.name;

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'My App (Dev)';
      case Flavor.staging:
        return 'My App (Staging)';
      case Flavor.prod:
        return 'My App';
    }
  }

}
