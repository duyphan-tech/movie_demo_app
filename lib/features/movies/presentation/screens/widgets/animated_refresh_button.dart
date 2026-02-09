import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class AnimatedRefreshButton extends HookConsumerWidget {
  final Future<void> Function() onRefresh;
  final Color? color;

  const AnimatedRefreshButton({super.key, required this.onRefresh, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isRefreshing = useState(false);

    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    final handlePress = useCallback(() async {
      if (isRefreshing.value) return;

      isRefreshing.value = true;
      controller.repeat();

      try {
        await onRefresh();
      } finally {
        if (context.mounted) {
          isRefreshing.value = false;
          controller.stop();
          controller.reset();
        }
      }
    }, [onRefresh]);

    return RotationTransition(
      turns: controller,
      child: IconButton(
        onPressed: isRefreshing.value ? null : handlePress,
        icon: Icon(
          Icons.refresh,
          color: isRefreshing.value ? Colors.grey : (color ?? Colors.black),
        ),
        tooltip: context.l10n.retry,
      ),
    );
  }
}
