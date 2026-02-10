import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/hooks/use_debounce.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';

class FavoriteButton extends HookConsumerWidget {
  final int movieId;
  final Color? color;
  final double size;

  const FavoriteButton({
    super.key,
    required this.movieId,
    this.color,
    this.size = 28,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 150),
      lowerBound: 0.0,
      upperBound: 0.2,
    );

    final isFavServer = ref.watch(
      favoritesProvider.select((s) => s.contains(movieId)),
    );

    final isFavLocal = useState<bool?>(null);

    final debouncedApiCall = useDebounce(() {
      final currentVisualState = isFavLocal.value;

      if (currentVisualState != null && currentVisualState != isFavServer) {
        ref.read(favoritesProvider.notifier).toggleFavorite(movieId);
      }

      isFavLocal.value = null;
    }, duration: const Duration(milliseconds: 500));

    void handlePress() {
      controller.forward().then((_) => controller.reverse());

      final currentVisual = isFavLocal.value ?? isFavServer;
      final newVisual = !currentVisual;

      isFavLocal.value = newVisual;

      debouncedApiCall();
    }

    final isVisibleFav = isFavLocal.value ?? isFavServer;

    return ScaleTransition(
      scale: Tween(
        begin: 1.0,
        end: 0.8,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut)),
      child: IconButton(
        onPressed: handlePress,
        icon: Icon(
          isVisibleFav ? Icons.bookmark : Icons.bookmark_border,
          color: isVisibleFav
              ? (color ?? Colors.indigo)
              : (color ?? Colors.black),
          size: size,
        ),
      ),
    );
  }
}
