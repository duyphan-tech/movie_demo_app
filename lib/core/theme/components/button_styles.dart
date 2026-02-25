import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/tokens/tokens.dart';

/// Button styles - sync với Figma Button components
/// Có thể dễ dàng update khi design thay đổi

class ButtonStyles {
  ButtonStyles._();

  // ====================
  // Primary Button (Theme compatible)
  // ====================
  static ButtonStyle get primary {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorTokens.brandPrimary.withValues(alpha: 0.5);
        }
        return ColorTokens.brandPrimary;
      }),
      foregroundColor: WidgetStateProperty.all(ColorTokens.brandOnPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: RadiusTokens.buttonRadius,
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Secondary Button (Theme compatible)
  // ====================
  static ButtonStyle get secondary {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(ColorTokens.brandSecondary),
      foregroundColor: WidgetStateProperty.all(ColorTokens.brandOnSecondary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: RadiusTokens.buttonRadius,
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Outline Button (Theme compatible)
  // ====================
  static ButtonStyle outline(BuildContext context) {
    final borderColor = context.borderColor;
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all(context.textPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      side: WidgetStateProperty.all(BorderSide(color: borderColor)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: RadiusTokens.buttonRadius,
        ),
      ),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Ghost Button (Theme compatible)
  // ====================
  static ButtonStyle get ghost {
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all(ColorTokens.brandPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Danger Button (Theme compatible)
  // ====================
  static ButtonStyle get danger {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(ColorTokens.error),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.buttonPaddingHorizontal,
          vertical: SpacingTokens.buttonPaddingVertical,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: RadiusTokens.buttonRadius,
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelLg.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Small Primary Button (Instance method - cần context)
  // ====================
  static ButtonStyle smallPrimary(BuildContext context) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.disabled)) {
          return ColorTokens.brandPrimary.withValues(alpha: 0.5);
        }
        return ColorTokens.brandPrimary;
      }),
      foregroundColor: WidgetStateProperty.all(ColorTokens.brandOnPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: SpacingTokens.md,
          vertical: SpacingTokens.sm,
        ),
      ),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(RadiusTokens.buttonSmall),
        ),
      ),
      elevation: WidgetStateProperty.all(0),
      textStyle: WidgetStateProperty.all(
        TypographyTokens.labelMd.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // ====================
  // Icon Button (Theme compatible)
  // ====================
  static ButtonStyle iconButton(BuildContext context) {
    return ButtonStyle(
      backgroundColor: WidgetStateProperty.all(Colors.transparent),
      foregroundColor: WidgetStateProperty.all(context.textPrimary),
      padding: WidgetStateProperty.all(
        const EdgeInsets.all(SpacingTokens.sm),
      ),
      shape: WidgetStateProperty.all(const CircleBorder()),
    );
  }
}
