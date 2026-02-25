import 'package:flutter/material.dart';

/// Shadow/Elevation tokens - sync với Figma

class ShadowTokens {
  ShadowTokens._();

  // ====================
  // Light Theme Shadows
  // ====================
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> xs = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0D000000), // 5% opacity
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x0F000000), // 6% opacity
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x14000000), // 8% opacity
      blurRadius: 8,
      offset: Offset(0, 8),
    ),
  ];

  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x1A000000), // 10% opacity
      blurRadius: 16,
      offset: Offset(0, 16),
    ),
  ];

  // ====================
  // Dark Theme Shadows (subtle hơn)
  // ====================
  static const List<BoxShadow> darkXs = [
    BoxShadow(
      color: Color(0x26000000), // 15% opacity
      blurRadius: 2,
      offset: Offset(0, 1),
    ),
  ];

  static const List<BoxShadow> darkSm = [
    BoxShadow(
      color: Color(0x26000000), // 15% opacity
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> darkMd = [
    BoxShadow(
      color: Color(0x29000000), // 16% opacity
      blurRadius: 6,
      offset: Offset(0, 4),
    ),
  ];

  // ====================
  // Component Specific
  // ====================
  static const List<BoxShadow> card = sm;
  static const List<BoxShadow> cardHovered = md;
  static const List<BoxShadow> button = xs;
  static const List<BoxShadow> buttonPressed = none;
  static const List<BoxShadow> bottomSheet = lg;
  static const List<BoxShadow> dialog = xl;
  static const List<BoxShadow> floatingButton = lg;
}

/// Extension cho BuildContext
extension ShadowTokensExtension on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  List<BoxShadow> get shadowXs => _isDark ? ShadowTokens.darkXs : ShadowTokens.xs;
  List<BoxShadow> get shadowSm => _isDark ? ShadowTokens.darkSm : ShadowTokens.sm;
  List<BoxShadow> get shadowMd => _isDark ? ShadowTokens.darkMd : ShadowTokens.md;
  List<BoxShadow> get shadowLg => ShadowTokens.lg;
  List<BoxShadow> get shadowXl => ShadowTokens.xl;
  List<BoxShadow> get shadowNone => ShadowTokens.none;
}
