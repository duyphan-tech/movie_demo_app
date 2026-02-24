import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentlyPlayingVideoIdProvider =
    NotifierProvider<_PlayingVideoNotifier, String?>(_PlayingVideoNotifier.new);

class _PlayingVideoNotifier extends Notifier<String?> {
  @override
  String? build() => null;

  void setPlayingVideo(String? videoId) {
    state = videoId;
  }
}
