import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

part 'video_provider.g.dart';

/// Provider returns prioritized video list
/// - Official trailers first
/// - Then Teaser and others
@riverpod
Future<VideoList> movieVideos(Ref ref, int movieId) async {
  final movieRepo = ref.read(movieRepositoryProvider);

  final result = await movieRepo.getMovieVideos(movieId);

  return result.fold(
    (failure) => throw failure,
    (videoResponse) => _processVideos(videoResponse.results),
  );
}

/// Process and sort video list
VideoList _processVideos(List<Video> videos) {
  // Filter only YouTube videos
  final youtubeVideos = videos.where((v) => v.site == 'YouTube').toList();

  if (youtubeVideos.isEmpty) {
    return const VideoList();
  }

  // Sort: Official trailers first, then others
  final sortedVideos = _sortVideosByPriority(youtubeVideos);

  // Get main video (first official trailer, or first trailer)
  final mainVideo = sortedVideos.firstWhere(
    (v) => v.type == 'Trailer' && v.official,
    orElse: () => sortedVideos.firstWhere(
      (v) => v.type == 'Trailer',
      orElse: () => sortedVideos.first,
    ),
  );

  // Remaining videos (max 2 to display immediately)
  final otherVideos = sortedVideos.where((v) => v.id != mainVideo.id).toList();
  final displayVideos = otherVideos.take(2).toList();

  // More than 3 videos?
  final hasMoreVideos = sortedVideos.length > 3;

  return VideoList(
    mainVideo: mainVideo,
    displayVideos: displayVideos,
    allVideos: sortedVideos,
    hasMoreVideos: hasMoreVideos,
  );
}

/// Sort videos by priority:
/// 1. Official Trailer
/// 2. Trailer (not official)
/// 3. Official Teaser
/// 4. Teaser (not official)
/// 5. Others
List<Video> _sortVideosByPriority(List<Video> videos) {
  final sorted = List<Video>.from(videos);

  sorted.sort((a, b) {
    // Prioritize official first
    if (a.official != b.official) {
      return a.official ? -1 : 1;
    }

    // Prioritize Trailer over Teaser
    final aType = _getTypePriority(a.type);
    final bType = _getTypePriority(b.type);

    if (aType != bType) {
      return aType.compareTo(bType);
    }

    // Same priority, sort by newest published_at
    return b.publishedAt.compareTo(a.publishedAt);
  });

  return sorted;
}

/// Get type priority (smaller = higher priority)
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
