import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

part 'video_provider.g.dart';

@riverpod
Future<VideoList> movieVideos(Ref ref, int movieId) async {
  final movieRepo = ref.read(movieRepositoryProvider);

  final result = await movieRepo.getMovieVideos(movieId);

  return result.fold(
    (failure) => throw failure,
    (videoResponse) => _processVideos(videoResponse.results),
  );
}

VideoList _processVideos(List<Video> videos) {
  final youtubeVideos = videos.where((v) => v.site == 'YouTube').toList();

  if (youtubeVideos.isEmpty) {
    return const VideoList();
  }

  final sortedVideos = _sortVideosByPriority(youtubeVideos);

  final mainVideo = sortedVideos.firstWhere(
    (v) => v.type == 'Trailer' && v.official,
    orElse: () => sortedVideos.firstWhere(
      (v) => v.type == 'Trailer',
      orElse: () => sortedVideos.first,
    ),
  );

  final otherVideos = sortedVideos.where((v) => v.id != mainVideo.id).toList();
  final displayVideos = otherVideos.take(2).toList();

  final hasMoreVideos = sortedVideos.length > 3;

  return VideoList(
    mainVideo: mainVideo,
    displayVideos: displayVideos,
    allVideos: sortedVideos,
    hasMoreVideos: hasMoreVideos,
  );
}

List<Video> _sortVideosByPriority(List<Video> videos) {
  final sorted = List<Video>.from(videos);

  sorted.sort((a, b) {
    if (a.official != b.official) {
      return a.official ? -1 : 1;
    }

    final aType = _getTypePriority(a.type);
    final bType = _getTypePriority(b.type);

    if (aType != bType) {
      return aType.compareTo(bType);
    }

    return b.publishedAt.compareTo(a.publishedAt);
  });

  return sorted;
}

int _getTypePriority(String type) {
  switch (type) {
    case 'Trailer':
      return 0;
    case 'Teaser':
      return 1;
    case 'Featurette':
      return 2;
    case 'Behind the Scenes':
      return 3;
    case 'Clip':
      return 4;
    default:
      return 5;
  }
}
