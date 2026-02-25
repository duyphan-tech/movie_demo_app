import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';

class VideoThumbnail extends HookWidget {
  final String videoKey;
  final double width;
  final double height;
  final double iconSize;

  const VideoThumbnail({
    super.key,
    required this.videoKey,
    this.width = 140,
    this.height = 80,
    this.iconSize = 32,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final errorWidget = useMemoized(
      () => Container(
        width: width,
        height: height,
        color: colorScheme.surfaceContainerHighest,
        child: Icon(AppIcon.movie),
      ),
      [width, height, colorScheme],
    );

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Image.network(
            'https://img.youtube.com/vi/$videoKey/mqdefault.jpg',
            width: width,
            height: height,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => errorWidget,
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black38,
              child: Icon(
                AppIcon.playCircle,
                color: Colors.white,
                size: iconSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
