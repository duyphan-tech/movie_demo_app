import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/tokens/tokens.dart';

/// Input styles - sync với Figma Input components

class InputStyles {
  InputStyles._();

  // ====================
  // Default Input Decoration
  // ====================
  static InputDecoration defaultDecoration(BuildContext context, {
    String? hintText,
    String? labelText,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? errorText,
    bool enabled = true,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      errorText: errorText,
      enabled: enabled,
      // Colors
      fillColor: colorScheme.surface,
      filled: true,
      // Border
      border: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: BorderSide(color: context.borderColor.withValues(alpha: 0.5)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.brandPrimary, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.error, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: const BorderSide(color: ColorTokens.error, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.inputRadius,
        borderSide: BorderSide(color: context.borderColor.withValues(alpha: 0.5)),
      ),
      // Content padding
      contentPadding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.inputPaddingHorizontal,
        vertical: SpacingTokens.inputPaddingVertical,
      ),
      // Text styles
      hintStyle: TypographyTokens.bodyMd.copyWith(
        color: context.textTertiary,
      ),
      labelStyle: TypographyTokens.bodyMd.copyWith(
        color: context.textSecondary,
      ),
      errorStyle: TypographyTokens.labelSm.copyWith(
        color: ColorTokens.error,
      ),
    );
  }

  // ====================
  // Search Input Decoration
  // ====================
  static InputDecoration searchDecoration(BuildContext context, {
    String? hintText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      prefixIcon: Icon(Icons.search, color: context.textTertiary),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: context.bgSurfaceVariant,
      border: OutlineInputBorder(
        borderRadius: RadiusTokens.circularLg,
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.circularLg,
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: RadiusTokens.circularLg,
        borderSide: const BorderSide(color: ColorTokens.brandPrimary, width: 1),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: SpacingTokens.lg,
        vertical: SpacingTokens.md,
      ),
      hintStyle: TypographyTokens.bodyMd.copyWith(
        color: context.textTertiary,
      ),
    );
  }

  // ====================
  // Underline Input Decoration
  // ====================
  static InputDecoration underlineDecoration(BuildContext context, {
    String? hintText,
    String? labelText,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      border: const UnderlineInputBorder(),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: context.borderColor),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: ColorTokens.brandPrimary, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: SpacingTokens.sm,
      ),
      hintStyle: TypographyTokens.bodyMd.copyWith(
        color: context.textTertiary,
      ),
    );
  }
}
