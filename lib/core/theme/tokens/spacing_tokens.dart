import 'package:flutter/material.dart';

class SpacingTokens {
  SpacingTokens._();

  // Base unit = 4px
  static const double base = 4.0;

  // Scale
  static const double none = 0.0;
  static const double xs = 4.0; // 1x
  static const double sm = 8.0; // 2x
  static const double md = 12.0; // 3x
  static const double lg = 16.0; // 4x
  static const double xl = 24.0; // 6x
  static const double xxl = 32.0; // 8x
  static const double xxxl = 48.0; // 12x

  // Section spacing
  static const double sectionSmall = 24.0;
  static const double sectionMedium = 32.0;
  static const double sectionLarge = 48.0;
  static const double sectionXLarge = 64.0;

  // Screen padding
  static const double screenPaddingHorizontal = 16.0;
  static const double screenPaddingVertical = 16.0;

  // Component specific
  static const double cardPadding = 16.0;
  static const double buttonPaddingHorizontal = 16.0;
  static const double buttonPaddingVertical = 12.0;
  static const double inputPaddingHorizontal = 16.0;
  static const double inputPaddingVertical = 12.0;
  static const double listItemSpacing = 12.0;
  static const double gridSpacing = 16.0;
}

extension SpacingTokensExtension on BuildContext {
  EdgeInsets get screenPadding => const EdgeInsets.symmetric(
    horizontal: SpacingTokens.screenPaddingHorizontal,
    vertical: SpacingTokens.screenPaddingVertical,
  );

  EdgeInsets get screenPaddingHorizontal => const EdgeInsets.symmetric(
    horizontal: SpacingTokens.screenPaddingHorizontal,
  );

  Widget get gapNone => const SizedBox.shrink();
  Widget get gapXs =>
      const SizedBox(width: SpacingTokens.xs, height: SpacingTokens.xs);
  Widget get gapSm =>
      const SizedBox(width: SpacingTokens.sm, height: SpacingTokens.sm);
  Widget get gapMd =>
      const SizedBox(width: SpacingTokens.md, height: SpacingTokens.md);
  Widget get gapLg =>
      const SizedBox(width: SpacingTokens.lg, height: SpacingTokens.lg);
  Widget get gapXl =>
      const SizedBox(width: SpacingTokens.xl, height: SpacingTokens.xl);
  Widget get gapXxl =>
      const SizedBox(width: SpacingTokens.xxl, height: SpacingTokens.xxl);
}

class Insets {
  Insets._();

  // All sides
  static const EdgeInsets none = EdgeInsets.zero;
  static const EdgeInsets xs = EdgeInsets.all(SpacingTokens.xs);
  static const EdgeInsets sm = EdgeInsets.all(SpacingTokens.sm);
  static const EdgeInsets md = EdgeInsets.all(SpacingTokens.md);
  static const EdgeInsets lg = EdgeInsets.all(SpacingTokens.lg);
  static const EdgeInsets xl = EdgeInsets.all(SpacingTokens.xl);

  // Symmetric
  static const EdgeInsets hSm = EdgeInsets.symmetric(
    horizontal: SpacingTokens.sm,
  );
  static const EdgeInsets hMd = EdgeInsets.symmetric(
    horizontal: SpacingTokens.md,
  );
  static const EdgeInsets hLg = EdgeInsets.symmetric(
    horizontal: SpacingTokens.lg,
  );
  static const EdgeInsets vSm = EdgeInsets.symmetric(
    vertical: SpacingTokens.sm,
  );
  static const EdgeInsets vMd = EdgeInsets.symmetric(
    vertical: SpacingTokens.md,
  );
  static const EdgeInsets vLg = EdgeInsets.symmetric(
    vertical: SpacingTokens.lg,
  );

  // Screen default
  static const EdgeInsets screen = EdgeInsets.symmetric(
    horizontal: SpacingTokens.screenPaddingHorizontal,
    vertical: SpacingTokens.screenPaddingVertical,
  );
}
