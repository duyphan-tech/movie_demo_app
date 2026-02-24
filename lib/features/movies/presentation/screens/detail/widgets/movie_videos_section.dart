import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/video_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_widgets.dart';

class MovieVideosSection extends ConsumerWidget {
  final int movieId;

  const MovieVideosSection({super.key, required this.movieId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final videoAsync = ref.watch(movieVideosProvider(movieId));

    return videoAsync.when(
      data: (videoList) => VideoContent(videoList: videoList),
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }
}
