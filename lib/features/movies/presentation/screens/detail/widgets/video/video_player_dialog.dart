import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/theme/app_icon.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class VideoPlayerDialog extends HookWidget {
  final String videoKey;
  final String videoName;

  const VideoPlayerDialog({
    super.key,
    required this.videoKey,
    required this.videoName,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

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
    );

    useEffect(() {
      controller.loadVideoById(videoId: videoKey);
      return controller.close;
    }, [videoKey]);

    final openInYouTube = useCallback(() async {
      final uri = Uri.parse('https://youtube.com/watch?v=$videoKey');
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }, [videoKey]);

    return Dialog(
      backgroundColor: colorScheme.surface,
      insetPadding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: YoutubePlayer(controller: controller),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        videoName,
                        style: TextStyle(color: colorScheme.onSurface),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(4),
                      TextButton.icon(
                        onPressed: openInYouTube,
                        icon: const Icon(Icons.open_in_new, size: 16),
                        label: Text(context.l10n.openInYouTube),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.red,
                          padding: EdgeInsets.zero,
                          minimumSize: Size.zero,
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: Icon(AppIcon.clear, color: colorScheme.onSurface),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
