import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import '../video_player_dialog_ext.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_badges.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_thumbnail.dart';

class VideoListItem extends HookWidget {
  final Video video;

  const VideoListItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final playVideo = useCallback(
      () => context.showVideoPlayerDialog(
        videoKey: video.key,
        videoName: video.name,
      ),
      [video.key, video.name],
    );

    return GestureDetector(
      onTap: playVideo,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VideoThumbnail(videoKey: video.key),
          const Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoBadges(type: video.type, isOfficial: video.official),
                const Gap(8),
                Text(
                  video.name,
                  style: textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
