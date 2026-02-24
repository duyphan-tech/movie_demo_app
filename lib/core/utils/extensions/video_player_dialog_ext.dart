import 'package:flutter/material.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/video/video_player_dialog.dart';

extension VideoPlayerDialogExtension on BuildContext {
  void showVideoPlayerDialog({
    required String videoKey,
    required String videoName,
  }) {
    showDialog(
      context: this,
      builder: (context) =>
          VideoPlayerDialog(videoKey: videoKey, videoName: videoName),
    );
  }
}
