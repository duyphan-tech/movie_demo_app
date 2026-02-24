import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/video_player_provider.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class LazyYouTubePlayer extends HookConsumerWidget {
  final String videoKey;
  final double aspectRatio;
  final VoidCallback? onPlaying;

  const LazyYouTubePlayer({
    super.key,
    required this.videoKey,
    this.aspectRatio = 16 / 9,
    this.onPlaying,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;

    final isInitialized = useState(false);

    final controller = useMemoized(
      () => YoutubePlayerController(
        params: const YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          enableCaption: true,
          showVideoAnnotations: false,
          strictRelatedVideos: true,
          color: 'red',
        ),
      ),
      [],
    );

    useEffect(() => controller.close, [controller]);

    ref.listen(currentlyPlayingVideoIdProvider, (previous, next) {
      if (previous == videoKey && next != videoKey) {
        controller.pauseVideo();
      }
    });

    final initializePlayer = useCallback(() {
      if (isInitialized.value) return;

      controller.loadVideoById(videoId: videoKey);
      isInitialized.value = true;
      ref
          .read(currentlyPlayingVideoIdProvider.notifier)
          .setPlayingVideo(videoKey);
      onPlaying?.call();
    }, [videoKey, onPlaying, controller, ref]);

    if (isInitialized.value) {
      return AspectRatio(
        aspectRatio: aspectRatio,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: YoutubePlayer(controller: controller),
        ),
      );
    }

    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: initializePlayer,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(
                'https://img.youtube.com/vi/$videoKey/hqdefault.jpg',
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  color: colorScheme.surfaceContainerHighest,
                  child: Icon(AppIcon.icon_movie, size: 64),
                ),
              ),
              ColoredBox(color: Colors.black38),
              Center(
                child: Container(
                  width: 72,
                  height: 72,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(77),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Icon(
                    AppIcon.icon_play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
