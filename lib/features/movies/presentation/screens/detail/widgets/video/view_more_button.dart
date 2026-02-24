import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class ViewMoreButton extends HookWidget {
  final VoidCallback onTap;
  final int remainingCount;

  const ViewMoreButton({
    super.key,
    required this.onTap,
    required this.remainingCount,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Sử dụng useCallback để tối ưu callback
    final handleTap = useCallback(
      () => onTap(),
      [onTap],
    );

    return GestureDetector(
      onTap: handleTap,
      child: Container(
        width: 160,
        height: 110,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: colorScheme.outlineVariant, width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(AppIcon.icon_playlist, size: 40, color: colorScheme.primary),
            const Gap(4),
            Text(
              '+$remainingCount',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
              ),
            ),
            Text(
              context.l10n.viewAllVideos,
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
