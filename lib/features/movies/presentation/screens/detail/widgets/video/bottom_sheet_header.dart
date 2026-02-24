import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class BottomSheetHeader extends HookWidget {
  final int videoCount;

  const BottomSheetHeader({super.key, required this.videoCount});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    // Sử dụng useCallback để tối ưu callback
    final onClose = useCallback(() => Navigator.of(context).pop(), []);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Column(
        children: [
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.outline,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const Gap(16),
          Row(
            children: [
              Expanded(
                child: Text(
                  context.l10n.allVideos(videoCount),
                  style: textTheme.titleLarge,
                ),
              ),
              IconButton(onPressed: onClose, icon: Icon(AppIcon.icon_clear)),
            ],
          ),
        ],
      ),
    );
  }
}
