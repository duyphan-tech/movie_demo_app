import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/app_color.dart';
import 'package:movie_demo_app/core/theme/app_typography.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.lightBackground,
    colorScheme: ColorScheme.light(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
      surface: Colors.white,
      onPrimary: Colors.white,
      onSurface: Colors.black87,
      error: AppColor.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black87,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black87),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: AppColor.greyText,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: Colors.black87,
      displayColor: Colors.black,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),

        textStyle: AppTypography.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          inherit: true,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: AppColor.black, size: 24.0),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColor.primaryColor,
    scaffoldBackgroundColor: AppColor.darkBackground,
    colorScheme: ColorScheme.dark(
      primary: AppColor.primaryColor,
      secondary: AppColor.secondaryColor,
      surface: AppColor.darkSurface,
      onPrimary: Colors.white,
      onSurface: Colors.white,
      onSurfaceVariant: AppColor.greyText,
      error: AppColor.error,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.darkBackground,
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
    ),
    cardTheme: CardThemeData(
      color: AppColor.darkSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColor.darkSurface,
      selectedItemColor: AppColor.primaryColor,
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    textTheme: AppTypography.textTheme.apply(
      bodyColor: Colors.white70,
      displayColor: Colors.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: Colors.white,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaryColor,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: AppTypography.textTheme.labelLarge?.copyWith(
          fontWeight: FontWeight.bold,
          inherit: true,
        ),
      ),
    ),

    iconTheme: const IconThemeData(color: Colors.white, size: 24.0),
  );
}
