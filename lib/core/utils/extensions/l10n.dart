import 'package:flutter/widgets.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

extension LocalizedBuildContext on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}
