import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/utils/extensions/video_player_dialog_ext.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_thumbnail_card.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/view_more_button.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video_list_bottom_sheet.dart';

class VideoListRow extends HookWidget {
  final List<Video> videos;
  final bool hasMore;
  final List<Video> allVideos;

  const VideoListRow({
    super.key,
    required this.videos,
    required this.hasMore,
    required this.allVideos,
  });

  @override
  Widget build(BuildContext context) {
    final showAllVideos = useCallback(
      () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => VideoListBottomSheet(videos: allVideos),
      ),
      [allVideos],
    );

    final playVideo = useCallback(
      (Video video) => context.showVideoPlayerDialog(
        videoKey: video.key,
        videoName: video.name,
      ),
      [],
    );

    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: videos.length + (hasMore ? 1 : 0),
        separatorBuilder: (_, __) => const Gap(12),
        itemBuilder: (context, index) {
          if (hasMore && index == videos.length) {
            return ViewMoreButton(
              onTap: showAllVideos,
              remainingCount: allVideos.length - videos.length,
            );
          }

          final video = videos[index];
          return SizedBox(
            width: 160,
            child: VideoThumbnailCard(
              videoKey: video.key,
              title: video.name,
              type: video.type,
              onTap: () => playVideo(video),
            ),
          );
        },
      ),
    );
  }
}
