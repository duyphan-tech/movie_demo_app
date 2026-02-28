import 'package:flutter/widgets.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get l10n {
    final localizations = AppLocalizations.of(this);
    if (localizations == null) {
      throw FlutterError(
        'AppLocalizations not found in context. '
        'Make sure to wrap your app with Localizations widget.',
      );
    }
    return localizations;
  }
}
