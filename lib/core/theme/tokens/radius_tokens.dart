import 'package:flutter/material.dart';

class RadiusTokens {
  RadiusTokens._();

  // Base scale
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 16.0;
  static const double xl = 20.0;
  static const double xxl = 24.0;
  static const double full = 9999.0; // Circle/pill

  // Component specific
  static const double button = 12.0;
  static const double buttonSmall = 8.0;
  static const double buttonPill = 9999.0;
  static const double input = 12.0;
  static const double card = 12.0;
  static const double cardLarge = 16.0;
  static const double chip = 8.0;
  static const double dialog = 20.0;
  static const double bottomSheet = 24.0;
  static const double avatar = 9999.0;
  static const double thumbnail = 8.0;

  // Radius objects
  static const Radius radiusNone = Radius.circular(none);
  static const Radius radiusXs = Radius.circular(xs);
  static const Radius radiusSm = Radius.circular(sm);
  static const Radius radiusMd = Radius.circular(md);
  static const Radius radiusLg = Radius.circular(lg);
  static const Radius radiusXl = Radius.circular(xl);
  static const Radius radiusXxl = Radius.circular(xxl);

  // BorderRadius objects
  static const BorderRadius circularNone = BorderRadius.all(radiusNone);
  static const BorderRadius circularXs = BorderRadius.all(radiusXs);
  static const BorderRadius circularSm = BorderRadius.all(radiusSm);
  static const BorderRadius circularMd = BorderRadius.all(radiusMd);
  static const BorderRadius circularLg = BorderRadius.all(radiusLg);
  static const BorderRadius circularXl = BorderRadius.all(radiusXl);
  static const BorderRadius circularXxl = BorderRadius.all(radiusXxl);

  // Component specific BorderRadius
  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(button),
  );
  static const BorderRadius inputRadius = BorderRadius.all(
    Radius.circular(input),
  );
  static const BorderRadius cardRadius = BorderRadius.all(
    Radius.circular(card),
  );
  static const BorderRadius cardLargeRadius = BorderRadius.all(
    Radius.circular(cardLarge),
  );
  static const BorderRadius chipRadius = BorderRadius.all(
    Radius.circular(chip),
  );
  static const BorderRadius dialogRadius = BorderRadius.all(
    Radius.circular(dialog),
  );
  static const BorderRadius bottomSheetRadius = BorderRadius.vertical(
    top: Radius.circular(bottomSheet),
  );
}

extension RadiusTokensExtension on BuildContext {
  BorderRadius get radiusNone => RadiusTokens.circularNone;
  BorderRadius get radiusXs => RadiusTokens.circularXs;
  BorderRadius get radiusSm => RadiusTokens.circularSm;
  BorderRadius get radiusMd => RadiusTokens.circularMd;
  BorderRadius get radiusLg => RadiusTokens.circularLg;
  BorderRadius get radiusXl => RadiusTokens.circularXl;
  BorderRadius get radiusXxl => RadiusTokens.circularXxl;
}
