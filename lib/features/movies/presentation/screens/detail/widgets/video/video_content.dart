import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/main_video_player.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_list_row.dart';

class VideoContent extends HookWidget {
  final VideoList videoList;

  const VideoContent({super.key, required this.videoList});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final hasContent = useMemoized(
      () => videoList.mainVideo != null || videoList.displayVideos.isNotEmpty,
      [videoList.mainVideo, videoList.displayVideos],
    );

    if (!hasContent) {
      return const SizedBox.shrink();
    }

    final children = useMemoized(
      () => [
        Text(context.l10n.trailers, style: textTheme.titleLarge),
        const Gap(16),
        if (videoList.mainVideo != null)
          MainVideoPlayer(video: videoList.mainVideo!),
        if (videoList.mainVideo != null && videoList.displayVideos.isNotEmpty)
          const Gap(16),
        if (videoList.displayVideos.isNotEmpty)
          VideoListRow(
            videos: videoList.displayVideos,
            hasMore: videoList.hasMoreVideos,
            allVideos: videoList.allVideos,
          ),
      ],
      [
        videoList.mainVideo,
        videoList.displayVideos,
        videoList.hasMoreVideos,
        videoList.allVideos,
        textTheme,
      ],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
