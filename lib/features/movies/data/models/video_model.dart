// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movie_demo_app/features/movies/domain/entities/video.dart';

part 'video_model.freezed.dart';
part 'video_model.g.dart';

@freezed
abstract class VideoModel with _$VideoModel {
  const factory VideoModel({
    required String id,
    required String name,
    required String key,
    required String site,
    required String type,
    required bool official,
    @JsonKey(name: 'published_at') required String publishedAt,
    @JsonKey(name: 'iso_639_1') required String iso6391,
    @JsonKey(name: 'iso_3166_1') required String iso31661,
    required int size,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);
}

@freezed
abstract class VideoResponseModel with _$VideoResponseModel {
  const factory VideoResponseModel({
    required int id,
    required List<VideoModel> results,
  }) = _VideoResponseModel;

  factory VideoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseModelFromJson(json);
}

// Extension for conversion to domain entity
extension VideoModelX on VideoModel {
  Video toDomain() {
    return Video(
      id: id,
      name: name,
      key: key,
      site: site,
      type: type,
      official: official,
      publishedAt: publishedAt,
      iso6391: iso6391,
      iso31661: iso31661,
      size: size,
    );
  }
}

extension VideoResponseModelX on VideoResponseModel {
  VideoResponse toDomain() {
    return VideoResponse(
      id: id,
      results: results.map((e) => e.toDomain()).toList(),
    );
  }
}
