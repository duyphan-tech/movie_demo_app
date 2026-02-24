import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/bottom_sheet_header.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_list_item.dart';

class VideoListBottomSheet extends HookWidget {
  final List<Video> videos;

  const VideoListBottomSheet({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final itemBuilder = useCallback(
      (BuildContext context, int index) => VideoListItem(video: videos[index]),
      [videos],
    );

    final separatorBuilder = useCallback(
      (_, __) => const SizedBox(height: 16),
      [],
    );

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              BottomSheetHeader(videoCount: videos.length),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  itemCount: videos.length,
                  separatorBuilder: separatorBuilder,
                  itemBuilder: itemBuilder,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
