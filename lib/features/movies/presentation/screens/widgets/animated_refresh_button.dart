import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/hooks/use_async_lock.dart';

class AnimatedRefreshButton extends HookConsumerWidget {
  final Future<void> Function() onRefresh;
  final Color? color;

  const AnimatedRefreshButton({super.key, required this.onRefresh, this.color});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 1),
    );

    final asyncLock = useAsyncLock(() async {
      controller.repeat();
      try {
        await onRefresh();
      } finally {
        controller.stop();
        controller.reset();
      }
    });

    return RotationTransition(
      turns: controller,
      child: IconButton(
        onPressed: asyncLock.isLoading ? null : asyncLock.execute,
        icon: Icon(
          Icons.refresh,
          color: asyncLock.isLoading ? Colors.grey : (color ?? Colors.black),
        ),
        tooltip: context.l10n.retry,
      ),
    );
  }
}
