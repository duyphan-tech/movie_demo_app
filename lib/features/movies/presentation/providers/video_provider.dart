import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

part 'video_provider.g.dart';

/// Provider trả về danh sách video đã được sắp xếp ưu tiên
/// - Official trailers lên đầu
/// - Sau đó đến Teaser và các loại khác
@riverpod
Future<VideoList> movieVideos(Ref ref, int movieId) async {
  final movieRepo = ref.read(movieRepositoryProvider);

  final result = await movieRepo.getMovieVideos(movieId);

  return result.fold(
    (failure) => throw failure,
    (videoResponse) => _processVideos(videoResponse.results),
  );
}

/// Xử lý và sắp xếp danh sách video
VideoList _processVideos(List<Video> videos) {
  // Lọc chỉ lấy video YouTube
  final youtubeVideos = videos.where((v) => v.site == 'YouTube').toList();

  if (youtubeVideos.isEmpty) {
    return const VideoList();
  }

  // Sắp xếp: Official trailers trước, sau đó đến các loại khác
  final sortedVideos = _sortVideosByPriority(youtubeVideos);

  // Lấy video chính (official trailer đầu tiên, hoặc trailer đầu tiên)
  final mainVideo = sortedVideos.firstWhere(
    (v) => v.type == 'Trailer' && v.official,
    orElse: () => sortedVideos.firstWhere(
      (v) => v.type == 'Trailer',
      orElse: () => sortedVideos.first,
    ),
  );

  // Các video còn lại (tối đa 2 cái để hiển thị ngay)
  final otherVideos = sortedVideos.where((v) => v.id != mainVideo.id).toList();
  final displayVideos = otherVideos.take(2).toList();

  // Có nhiều hơn 3 video không?
  final hasMoreVideos = sortedVideos.length > 3;

  return VideoList(
    mainVideo: mainVideo,
    displayVideos: displayVideos,
    allVideos: sortedVideos,
    hasMoreVideos: hasMoreVideos,
  );
}

/// Sắp xếp video theo thứ tự ưu tiên:
/// 1. Official Trailer
/// 2. Trailer (không official)
/// 3. Official Teaser
/// 4. Teaser (không official)
/// 5. Các loại khác
List<Video> _sortVideosByPriority(List<Video> videos) {
  final sorted = List<Video>.from(videos);

  sorted.sort((a, b) {
    // Ưu tiên official trước
    if (a.official != b.official) {
      return a.official ? -1 : 1;
    }

    // Ưu tiên Trailer trước Teaser
    final aType = _getTypePriority(a.type);
    final bType = _getTypePriority(b.type);

    if (aType != bType) {
      return aType.compareTo(bType);
    }

    // Cùng priority thì xếp theo published_at mới nhất
    return b.publishedAt.compareTo(a.publishedAt);
  });

  return sorted;
}

/// Đánh giá độ ưu tiên của type (số nhỏ = ưu tiên cao)
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
