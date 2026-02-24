import 'package:freezed_annotation/freezed_annotation.dart';

part 'video.freezed.dart';

@freezed
abstract class Video with _$Video {
  const factory Video({
    required String id,
    required String name,
    required String key,
    required String site,
    required String type,
    required bool official,
    required String publishedAt,
    required String iso6391,
    required String iso31661,
    required int size,
  }) = _Video;
}

@freezed
abstract class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
    required int id,
    required List<Video> results,
  }) = _VideoResponse;
}

@freezed
abstract class VideoList with _$VideoList {
  const factory VideoList({
    Video? mainVideo,
    @Default([]) List<Video> displayVideos,
    @Default([]) List<Video> allVideos,
    @Default(false) bool hasMoreVideos,
  }) = _VideoList;
}
