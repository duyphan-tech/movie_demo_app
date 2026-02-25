import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/tokens/tokens.dart';
import 'package:movie_demo_app/core/theme/components/components.dart';

class AppTheme {
  // Helper cho outlined button trong theme
  static ButtonStyle get _outlineButtonStyle {
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all(ColorTokens.lightTextPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      side: WidgetStateProperty.all(
        const BorderSide(color: ColorTokens.lightBorder),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: RadiusTokens.buttonRadius),
      ),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  // Helper cho dark theme outlined button
  static ButtonStyle get _outlineButtonStyleDark {
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all(ColorTokens.darkTextPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      side: WidgetStateProperty.all(
        const BorderSide(color: ColorTokens.darkBorder),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(borderRadius: RadiusTokens.buttonRadius),
      ),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }

  // ====================
  // Light Theme
  // ====================
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    // Brand Colors
    primaryColor: ColorTokens.brandPrimary,
    scaffoldBackgroundColor: ColorTokens.lightBackground,
    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: ColorTokens.brandPrimary,
      onPrimary: ColorTokens.brandOnPrimary,
      primaryContainer: ColorTokens.brandPrimaryHover,
      secondary: ColorTokens.brandSecondary,
      onSecondary: ColorTokens.brandOnSecondary,
      surface: ColorTokens.lightSurface,
      surfaceContainerHighest: ColorTokens.lightSurfaceVariant,
      onSurface: ColorTokens.lightTextPrimary,
      onSurfaceVariant: ColorTokens.lightTextSecondary,
      outline: ColorTokens.lightBorder,
      error: ColorTokens.error,
      onError: Colors.white,
    ),
    // Typography
    textTheme: TypographyTokens.textTheme.apply(
      bodyColor: ColorTokens.lightTextPrimary,
      displayColor: ColorTokens.lightTextPrimary,
    ),
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: ColorTokens.lightSurface,
      foregroundColor: ColorTokens.lightTextPrimary,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: TypographyTokens.titleLg.copyWith(
        color: ColorTokens.lightTextPrimary,
      ),
      iconTheme: const IconThemeData(
        color: ColorTokens.lightTextPrimary,
        size: 24,
      ),
    ),
    // Card
    cardTheme: CardThemeData(
      color: ColorTokens.lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.cardRadius),
      margin: EdgeInsets.zero,
    ),
    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorTokens.lightSurface,
      selectedItemColor: ColorTokens.brandPrimary,
      unselectedItemColor: ColorTokens.lightTextTertiary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyles.primary),
    outlinedButtonTheme: OutlinedButtonThemeData(style: _outlineButtonStyle),
    textButtonTheme: TextButtonThemeData(style: ButtonStyles.ghost),
    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorTokens.lightSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.inputPaddingHorizontal,
        vertical: SpacingTokens.inputPaddingVertical,
      ),
      border: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.lightBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.lightBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.brandPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.error),
      ),
      hintStyle: TypographyTokens.bodyMd.copyWith(
        color: ColorTokens.lightTextTertiary,
      ),
    ),
    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorTokens.brandPrimary,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    // Icon
    iconTheme: const IconThemeData(
      color: ColorTokens.lightTextPrimary,
      size: 24,
    ),
    // Divider
    dividerTheme: const DividerThemeData(
      color: ColorTokens.lightBorder,
      thickness: 1,
      space: 1,
    ),
    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: ColorTokens.lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.dialogRadius),
    ),
    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorTokens.lightSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusTokens.bottomSheetRadius,
      ),
    ),
    // Chip
    chipTheme: ChipThemeData(
      backgroundColor: ColorTokens.lightSurfaceVariant,
      selectedColor: ColorTokens.brandPrimary.withValues(alpha: 0.1),
      labelStyle: TypographyTokens.labelMd,
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.md,
        vertical: SpacingTokens.xs,
      ),
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.chipRadius),
    ),
  );

  // ====================
  // Dark Theme
  // ====================
  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    // Brand Colors
    primaryColor: ColorTokens.brandPrimary,
    scaffoldBackgroundColor: ColorTokens.darkBackground,
    // Color Scheme
    colorScheme: const ColorScheme.dark(
      primary: ColorTokens.brandPrimary,
      onPrimary: ColorTokens.brandOnPrimary,
      primaryContainer: ColorTokens.brandPrimaryHover,
      secondary: ColorTokens.brandSecondary,
      onSecondary: ColorTokens.brandOnSecondary,
      surface: ColorTokens.darkSurface,
      surfaceContainerHighest: ColorTokens.darkSurfaceVariant,
      onSurface: ColorTokens.darkTextPrimary,
      onSurfaceVariant: ColorTokens.darkTextSecondary,
      outline: ColorTokens.darkBorder,
      error: ColorTokens.error,
      onError: Colors.white,
    ),
    // Typography
    textTheme: TypographyTokens.textTheme.apply(
      bodyColor: ColorTokens.darkTextPrimary,
      displayColor: ColorTokens.darkTextPrimary,
    ),
    // AppBar
    appBarTheme: AppBarTheme(
      backgroundColor: ColorTokens.darkBackground,
      foregroundColor: ColorTokens.darkTextPrimary,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: TypographyTokens.titleLg.copyWith(
        color: ColorTokens.darkTextPrimary,
      ),
      iconTheme: const IconThemeData(
        color: ColorTokens.darkTextPrimary,
        size: 24,
      ),
    ),
    // Card
    cardTheme: CardThemeData(
      color: ColorTokens.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.cardRadius),
      margin: EdgeInsets.zero,
    ),
    // Bottom Navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: ColorTokens.darkSurface,
      selectedItemColor: ColorTokens.brandPrimary,
      unselectedItemColor: ColorTokens.darkTextTertiary,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
      selectedLabelStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      unselectedLabelStyle: TextStyle(fontSize: 12),
    ),
    // Buttons
    elevatedButtonTheme: ElevatedButtonThemeData(style: ButtonStyles.primary),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: _outlineButtonStyleDark,
    ),
    textButtonTheme: TextButtonThemeData(style: ButtonStyles.ghost),
    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorTokens.darkSurface,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.inputPaddingHorizontal,
        vertical: SpacingTokens.inputPaddingVertical,
      ),
      border: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.darkBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.darkBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.brandPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.error),
      ),
      hintStyle: TypographyTokens.bodyMd.copyWith(
        color: ColorTokens.darkTextTertiary,
      ),
    ),
    // Floating Action Button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: ColorTokens.brandPrimary,
      foregroundColor: Colors.white,
      elevation: 2,
    ),
    // Icon
    iconTheme: const IconThemeData(
      color: ColorTokens.darkTextPrimary,
      size: 24,
    ),
    // Divider
    dividerTheme: const DividerThemeData(
      color: ColorTokens.darkBorder,
      thickness: 1,
      space: 1,
    ),
    // Dialog
    dialogTheme: DialogThemeData(
      backgroundColor: ColorTokens.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.dialogRadius),
    ),
    // Bottom Sheet
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ColorTokens.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: RadiusTokens.bottomSheetRadius,
      ),
    ),
    // Chip
    chipTheme: ChipThemeData(
      backgroundColor: ColorTokens.darkSurfaceVariant,
      selectedColor: ColorTokens.brandPrimary.withValues(alpha: 0.2),
      labelStyle: TypographyTokens.labelMd,
      padding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.md,
        vertical: SpacingTokens.xs,
      ),
      shape: RoundedRectangleBorder(borderRadius: RadiusTokens.chipRadius),
    ),
  );

  // ====================
  // Helpers
  // ====================
  static bool isDark(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData of(BuildContext context) {
    return Theme.of(context);
  }
}
