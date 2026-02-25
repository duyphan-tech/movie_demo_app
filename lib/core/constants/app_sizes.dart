/// Spacing and sizing constants
/// @deprecated Sử dụng SpacingTokens từ theme/tokens/spacing_tokens.dart

export '../theme/tokens/spacing_tokens.dart';

class AppSizes {
  AppSizes._();

  // Legacy constants - giữ lại cho backward compatibility
  // Nhưng nên chuyển sang dùng SpacingTokens

  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;

  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;

  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 24.0;
  static const double iconSizeLarge = 32.0;

  // Grid
  static const double gridSpacing = 16.0;
  static const int gridCrossAxisCount = 3;
  static const double gridChildAspectRatio = 0.5;
}
