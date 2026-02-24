// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider trả về danh sách video đã được sắp xếp ưu tiên
/// - Official trailers lên đầu
/// - Sau đó đến Teaser và các loại khác

@ProviderFor(movieVideos)
const movieVideosProvider = MovieVideosFamily._();

/// Provider trả về danh sách video đã được sắp xếp ưu tiên
/// - Official trailers lên đầu
/// - Sau đó đến Teaser và các loại khác

final class MovieVideosProvider
    extends
        $FunctionalProvider<
          AsyncValue<VideoList>,
          VideoList,
          FutureOr<VideoList>
        >
    with $FutureModifier<VideoList>, $FutureProvider<VideoList> {
  /// Provider trả về danh sách video đã được sắp xếp ưu tiên
  /// - Official trailers lên đầu
  /// - Sau đó đến Teaser và các loại khác
  const MovieVideosProvider._({
    required MovieVideosFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieVideosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieVideosHash();

  @override
  String toString() {
    return r'movieVideosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<VideoList> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<VideoList> create(Ref ref) {
    final argument = this.argument as int;
    return movieVideos(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieVideosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieVideosHash() => r'4fce937c88b9ae7a43524bae9b3e471aaacdeca9';

/// Provider trả về danh sách video đã được sắp xếp ưu tiên
/// - Official trailers lên đầu
/// - Sau đó đến Teaser và các loại khác

final class MovieVideosFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<VideoList>, int> {
  const MovieVideosFamily._()
    : super(
        retry: null,
        name: r'movieVideosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider trả về danh sách video đã được sắp xếp ưu tiên
  /// - Official trailers lên đầu
  /// - Sau đó đến Teaser và các loại khác

  MovieVideosProvider call(int movieId) =>
      MovieVideosProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieVideosProvider';
}
