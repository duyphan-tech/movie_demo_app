import 'package:flutter/material.dart';

class ColorTokens {
  ColorTokens._();

  // ====================
  // Brand Colors (Primary)
  // ====================
  static const Color brandPrimary = Color(0xFFE50914);
  static const Color brandPrimaryHover = Color(0xFFB20710);
  static const Color brandPrimaryPressed = Color(0xFF8B050C);
  static const Color brandPrimaryDisabled = Color(0xFFE50914);
  static const Color brandOnPrimary = Color(0xFFFFFFFF);

  // ====================
  // Secondary Colors
  // ====================
  static const Color brandSecondary = Color(0xFF1E88E5);
  static const Color brandSecondaryHover = Color(0xFF1565C0);
  static const Color brandOnSecondary = Color(0xFFFFFFFF);

  // ====================
  // Semantic Colors
  // ====================
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFC107);
  static const Color error = Color(0xFFCF6679);
  static const Color info = Color(0xFF2196F3);

  // ====================
  // Neutral Scale (Gray)
  // ====================
  static const Color neutral0 = Color(0xFFFFFFFF);
  static const Color neutral50 = Color(0xFFF5F5F5);
  static const Color neutral100 = Color(0xFFE0E0E0);
  static const Color neutral200 = Color(0xFFBDBDBD);
  static const Color neutral300 = Color(0xFF9E9E9E);
  static const Color neutral400 = Color(0xFF757575);
  static const Color neutral500 = Color(0xFF616161);
  static const Color neutral600 = Color(0xFF424242);
  static const Color neutral700 = Color(0xFF303030);
  static const Color neutral800 = Color(0xFF212121);
  static const Color neutral900 = Color(0xFF121212);
  static const Color neutral1000 = Color(0xFF000000);

  // ====================
  // Light Theme Surface
  // ====================
  static const Color lightBackground = Color(0xFFF5F5F5);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightSurfaceVariant = Color(0xFFF0F0F0);
  static const Color lightBorder = Color(0xFFE0E0E0);

  // ====================
  // Dark Theme Surface
  // ====================
  static const Color darkBackground = Color(0xFF121212);
  static const Color darkSurface = Color(0xFF1E1E1E);
  static const Color darkSurfaceVariant = Color(0xFF2C2C2C);
  static const Color darkBorder = Color(0xFF404040);

  // ====================
  // Text Colors (Light Theme)
  // ====================
  static const Color lightTextPrimary = Color(0xFF212121);
  static const Color lightTextSecondary = Color(0xFF757575);
  static const Color lightTextTertiary = Color(0xFF9E9E9E);
  static const Color lightTextDisabled = Color(0xFFBDBDBD);

  // ====================
  // Text Colors (Dark Theme)
  // ====================
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFFB3B3B3);
  static const Color darkTextTertiary = Color(0xFF808080);
  static const Color darkTextDisabled = Color(0xFF616161);
}

extension ColorTokensExtension on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  // Background
  Color get bgPrimary => _isDark ? ColorTokens.darkBackground : ColorTokens.lightBackground;
  Color get bgSurface => _isDark ? ColorTokens.darkSurface : ColorTokens.lightSurface;
  Color get bgSurfaceVariant => _isDark ? ColorTokens.darkSurfaceVariant : ColorTokens.lightSurfaceVariant;

  // Text
  Color get textPrimary => _isDark ? ColorTokens.darkTextPrimary : ColorTokens.lightTextPrimary;
  Color get textSecondary => _isDark ? ColorTokens.darkTextSecondary : ColorTokens.lightTextSecondary;
  Color get textTertiary => _isDark ? ColorTokens.darkTextTertiary : ColorTokens.lightTextTertiary;
  Color get textDisabled => _isDark ? ColorTokens.darkTextDisabled : ColorTokens.lightTextDisabled;

  // Border
  Color get borderColor => _isDark ? ColorTokens.darkBorder : ColorTokens.lightBorder;
}
