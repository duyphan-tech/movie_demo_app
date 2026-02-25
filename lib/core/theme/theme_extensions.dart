import 'package:flutter/material.dart';
import 'tokens/tokens.dart';
import 'components/components.dart';

extension ThemeExtensions on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  // ===== Colors =====
  // Backgrounds
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

  // Brand
  Color get brandPrimary => ColorTokens.brandPrimary;
  Color get brandSecondary => ColorTokens.brandSecondary;
  Color get brandOnPrimary => ColorTokens.brandOnPrimary;

  // Semantic
  Color get colorSuccess => ColorTokens.success;
  Color get colorWarning => ColorTokens.warning;
  Color get colorError => ColorTokens.error;
  Color get colorInfo => ColorTokens.info;

  // ===== Typography =====
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

  // ===== Spacing =====
  Widget get gapNone => const SizedBox.shrink();
  Widget get gapXs => const SizedBox(width: SpacingTokens.xs, height: SpacingTokens.xs);
  Widget get gapSm => const SizedBox(width: SpacingTokens.sm, height: SpacingTokens.sm);
  Widget get gapMd => const SizedBox(width: SpacingTokens.md, height: SpacingTokens.md);
  Widget get gapLg => const SizedBox(width: SpacingTokens.lg, height: SpacingTokens.lg);
  Widget get gapXl => const SizedBox(width: SpacingTokens.xl, height: SpacingTokens.xl);
  Widget get gapXxl => const SizedBox(width: SpacingTokens.xxl, height: SpacingTokens.xxl);

  EdgeInsets get screenPadding => SpacingTokensExtension(this).screenPadding;
  EdgeInsets get screenPaddingHorizontal => SpacingTokensExtension(this).screenPaddingHorizontal;

  // ===== Radius =====
  BorderRadius get radiusNone => RadiusTokens.circularNone;
  BorderRadius get radiusXs => RadiusTokens.circularXs;
  BorderRadius get radiusSm => RadiusTokens.circularSm;
  BorderRadius get radiusMd => RadiusTokens.circularMd;
  BorderRadius get radiusLg => RadiusTokens.circularLg;
  BorderRadius get radiusXl => RadiusTokens.circularXl;
  BorderRadius get radiusXxl => RadiusTokens.circularXxl;

  // ===== Shadows =====
  List<BoxShadow> get shadowXs => ShadowTokensExtension(this).shadowXs;
  List<BoxShadow> get shadowSm => ShadowTokensExtension(this).shadowSm;
  List<BoxShadow> get shadowMd => ShadowTokensExtension(this).shadowMd;
  List<BoxShadow> get shadowLg => ShadowTokens.lg;
  List<BoxShadow> get shadowXl => ShadowTokens.xl;
  List<BoxShadow> get shadowNone => ShadowTokens.none;

  // ===== Card Styles =====
  BoxDecoration get cardElevated => CardStyles.elevated(this);
  BoxDecoration get cardOutlined => CardStyles.outlined(this);
  BoxDecoration get cardLarge => CardStyles.large(this);
  BoxDecoration get cardListTile => CardStyles.listTile(this);

  // ===== Button Styles =====
  ButtonStyle get btnPrimary => ButtonStyles.primary;
  ButtonStyle get btnSecondary => ButtonStyles.secondary;
  ButtonStyle get btnOutline => ButtonStyles.outline(this);
  ButtonStyle get btnGhost => ButtonStyles.ghost;
  ButtonStyle get btnDanger => ButtonStyles.danger;
  ButtonStyle get btnSmallPrimary => ButtonStyles.smallPrimary(this);

  // ===== Input Styles =====
  InputDecoration inputDefault({
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    bool enabled = true,
  }) => InputStyles.defaultDecoration(
    this,
    hintText: hintText,
    labelText: labelText,
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,
    errorText: errorText,
    enabled: enabled,
  );

  InputDecoration inputSearch({
    String? hintText,
    Widget? suffixIcon,
  }) => InputStyles.searchDecoration(
    this,
    hintText: hintText,
    suffixIcon: suffixIcon,
  );

  // ===== Theme Data =====
  ThemeData get theme => Theme.of(this);
  ColorScheme get colors => Theme.of(this).colorScheme;
  TextTheme get textTheme => Theme.of(this).textTheme;
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}
