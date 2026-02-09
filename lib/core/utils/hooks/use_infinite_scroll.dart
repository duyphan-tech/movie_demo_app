import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void useInfiniteScroll({
  required ScrollController controller,
  required VoidCallback onLoadMore,
  double threshold = 200.0,
}) {
  useEffect(() {
    void listener() {
      if (!controller.hasClients) return;

      final maxScroll = controller.position.maxScrollExtent;
      final currentScroll = controller.position.pixels;

      if (currentScroll >= maxScroll - threshold) {
        onLoadMore();
      }
    }

    controller.addListener(listener);
    return () => controller.removeListener(listener);
  }, [controller, onLoadMore]);
}
