import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/lazy_youtube_player.dart';

class MainVideoPlayer extends HookWidget {
  final Video video;

  const MainVideoPlayer({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final children = useMemoized(
      () => [
        LazyYouTubePlayer(videoKey: video.key),
        if (video.name.isNotEmpty) ...[
          const Gap(8),
          Text(
            video.name,
            style: textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ],
      [video.key, video.name, textTheme],
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
