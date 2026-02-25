import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/tokens/tokens.dart';

/// Card styles - sync với Figma Card components

class CardStyles {
  CardStyles._();

  // ====================
  // Default Card
  // ====================
  static CardTheme defaultCard(BuildContext context) {
    return CardTheme(
      color: context.bgSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusTokens.cardRadius,
      ),
      margin: EdgeInsets.zero,
    );
  }

  // ====================
  // Elevated Card
  // ====================
  static BoxDecoration elevated(BuildContext context) {
    return BoxDecoration(
      color: context.bgSurface,
      borderRadius: RadiusTokens.cardRadius,
      boxShadow: context.shadowSm,
    );
  }

  // ====================
  // Outlined Card
  // ====================
  static BoxDecoration outlined(BuildContext context) {
    return BoxDecoration(
      color: context.bgSurface,
      borderRadius: RadiusTokens.cardRadius,
      border: Border.all(color: context.borderColor.withValues(alpha: 0.5))
    );
  }

  // ====================
  // Large Card
  // ====================
  static BoxDecoration large(BuildContext context) {
    return BoxDecoration(
      color: context.bgSurface,
      borderRadius: RadiusTokens.cardLargeRadius,
      boxShadow: context.shadowMd,
    );
  }

  // ====================
  // List Tile Card
  // ====================
  static BoxDecoration listTile(BuildContext context) {
    return BoxDecoration(
      color: context.bgSurface,
      borderRadius: RadiusTokens.circularSm,
      border: Border.all(color: context.borderColor.withValues(alpha: 0.5)),
    );
  }

  // ====================
  // Clickable Card
  // ====================
  static Widget clickable({
    required BuildContext context,
    required Widget child,
    required VoidCallback onTap,
    BoxDecoration? decoration,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: RadiusTokens.cardRadius,
        child: Ink(
          decoration: decoration ?? elevated(context),
          child: child,
        ),
      ),
    );
  }
}

/// Extension cho dễ dùng
extension CardStylesExtension on BuildContext {
  BoxDecoration get cardElevated => CardStyles.elevated(this);
  BoxDecoration get cardOutlined => CardStyles.outlined(this);
  BoxDecoration get cardLarge => CardStyles.large(this);
  BoxDecoration get cardListTile => CardStyles.listTile(this);
}
