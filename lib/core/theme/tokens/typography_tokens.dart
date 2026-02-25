import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TypographyTokens {
  TypographyTokens._();

  // ====================
  // Font Families
  // ====================
  static const String primaryFont = 'Roboto';
  static const String secondaryFont = 'Roboto';

  // ====================
  // Font Sizes
  // ====================
  static const double sizeDisplayLg = 57.0;
  static const double sizeDisplayMd = 45.0;
  static const double sizeDisplaySm = 36.0;

  static const double sizeHeadingLg = 32.0;
  static const double sizeHeadingMd = 28.0;
  static const double sizeHeadingSm = 24.0;

  static const double sizeTitleLg = 22.0;
  static const double sizeTitleMd = 16.0;
  static const double sizeTitleSm = 14.0;

  static const double sizeBodyLg = 16.0;
  static const double sizeBodyMd = 14.0;
  static const double sizeBodySm = 12.0;

  static const double sizeLabelLg = 14.0;
  static const double sizeLabelMd = 12.0;
  static const double sizeLabelSm = 11.0;

  // ====================
  // Font Weights
  // ====================
  static const FontWeight weightRegular = FontWeight.w400;
  static const FontWeight weightMedium = FontWeight.w500;
  static const FontWeight weightSemiBold = FontWeight.w600;
  static const FontWeight weightBold = FontWeight.w700;

  // ====================
  // Line Heights
  // ====================
  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;

  // ====================
  // Letter Spacing
  // ====================
  static const double letterSpacingTight = -0.25;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;

  // ====================
  // Text Styles
  // ====================
  static TextStyle get displayLg => GoogleFonts.roboto(
        fontSize: sizeDisplayLg,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingTight,
        height: lineHeightTight,
      );

  static TextStyle get displayMd => GoogleFonts.roboto(
        fontSize: sizeDisplayMd,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingNormal,
        height: lineHeightTight,
      );

  static TextStyle get displaySm => GoogleFonts.roboto(
        fontSize: sizeDisplaySm,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingNormal,
        height: lineHeightTight,
      );

  static TextStyle get headingLg => GoogleFonts.roboto(
        fontSize: sizeHeadingLg,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingNormal,
        height: lineHeightTight,
      );

  static TextStyle get headingMd => GoogleFonts.roboto(
        fontSize: sizeHeadingMd,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingNormal,
        height: lineHeightTight,
      );

  static TextStyle get headingSm => GoogleFonts.roboto(
        fontSize: sizeHeadingSm,
        fontWeight: weightRegular,
        letterSpacing: letterSpacingNormal,
        height: lineHeightTight,
      );

  static TextStyle get titleLg => GoogleFonts.roboto(
        fontSize: sizeTitleLg,
        fontWeight: weightMedium,
        letterSpacing: letterSpacingNormal,
        height: lineHeightNormal,
      );

  static TextStyle get titleMd => GoogleFonts.roboto(
        fontSize: sizeTitleMd,
        fontWeight: weightMedium,
        letterSpacing: 0.15,
        height: lineHeightNormal,
      );

  static TextStyle get titleSm => GoogleFonts.roboto(
        fontSize: sizeTitleSm,
        fontWeight: weightMedium,
        letterSpacing: 0.1,
        height: lineHeightNormal,
      );

  static TextStyle get bodyLg => GoogleFonts.roboto(
        fontSize: sizeBodyLg,
        fontWeight: weightRegular,
        letterSpacing: 0.5,
        height: lineHeightRelaxed,
      );

  static TextStyle get bodyMd => GoogleFonts.roboto(
        fontSize: sizeBodyMd,
        fontWeight: weightRegular,
        letterSpacing: 0.25,
        height: lineHeightRelaxed,
      );

  static TextStyle get bodySm => GoogleFonts.roboto(
        fontSize: sizeBodySm,
        fontWeight: weightRegular,
        letterSpacing: 0.4,
        height: lineHeightNormal,
      );

  static TextStyle get labelLg => GoogleFonts.roboto(
        fontSize: sizeLabelLg,
        fontWeight: weightMedium,
        letterSpacing: 0.1,
        height: lineHeightNormal,
      );

  static TextStyle get labelMd => GoogleFonts.roboto(
        fontSize: sizeLabelMd,
        fontWeight: weightMedium,
        letterSpacing: letterSpacingWide,
        height: lineHeightNormal,
      );

  static TextStyle get labelSm => GoogleFonts.roboto(
        fontSize: sizeLabelSm,
        fontWeight: weightMedium,
        letterSpacing: letterSpacingWide,
        height: lineHeightNormal,
      );

  // ====================
  // Full TextTheme
  // ====================
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLg,
        displayMedium: displayMd,
        displaySmall: displaySm,
        headlineLarge: headingLg,
        headlineMedium: headingMd,
        headlineSmall: headingSm,
        titleLarge: titleLg,
        titleMedium: titleMd,
        titleSmall: titleSm,
        bodyLarge: bodyLg,
        bodyMedium: bodyMd,
        bodySmall: bodySm,
        labelLarge: labelLg,
        labelMedium: labelMd,
        labelSmall: labelSm,
      );
}

extension TypographyTokensExtension on BuildContext {
  TextStyle get displayLg => TypographyTokens.displayLg;
  TextStyle get displayMd => TypographyTokens.displayMd;
  TextStyle get displaySm => TypographyTokens.displaySm;
  TextStyle get headingLg => TypographyTokens.headingLg;
  TextStyle get headingMd => TypographyTokens.headingMd;
  TextStyle get headingSm => TypographyTokens.headingSm;
  TextStyle get titleLg => TypographyTokens.titleLg;
  TextStyle get titleMd => TypographyTokens.titleMd;
  TextStyle get titleSm => TypographyTokens.titleSm;
  TextStyle get bodyLg => TypographyTokens.bodyLg;
  TextStyle get bodyMd => TypographyTokens.bodyMd;
  TextStyle get bodySm => TypographyTokens.bodySm;
  TextStyle get labelLg => TypographyTokens.labelLg;
  TextStyle get labelMd => TypographyTokens.labelMd;
  TextStyle get labelSm => TypographyTokens.labelSm;
}
