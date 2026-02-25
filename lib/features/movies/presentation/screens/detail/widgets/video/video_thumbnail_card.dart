import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';

class VideoThumbnailCard extends HookWidget {
  final String videoKey;
  final String? title;
  final String? type;
  final VoidCallback? onTap;

  const VideoThumbnailCard({
    super.key,
    required this.videoKey,
    this.title,
    this.type,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final handleTap = useCallback(() => onTap?.call(), [onTap]);

    return GestureDetector(
      onTap: handleTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                'https://img.youtube.com/vi/$videoKey/mqdefault.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(AppIcon.movie),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                color: Colors.black38,
                child: Icon(
                  AppIcon.playCircle,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
            if (type != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    type ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            if (title != null)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black.withAlpha(204)],
                    ),
                  ),
                  child: Text(
                    title ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
