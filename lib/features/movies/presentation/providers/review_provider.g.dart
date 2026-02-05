// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReviewNotifier)
const reviewProvider = ReviewNotifierFamily._();

final class ReviewNotifierProvider
    extends $AsyncNotifierProvider<ReviewNotifier, List<Review>> {
  const ReviewNotifierProvider._({
    required ReviewNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'reviewProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$reviewNotifierHash();

  @override
  String toString() {
    return r'reviewProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ReviewNotifier create() => ReviewNotifier();

  @override
  bool operator ==(Object other) {
    return other is ReviewNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$reviewNotifierHash() => r'04546c00901cff83c40edfd0593b3ff0202653aa';

final class ReviewNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ReviewNotifier,
          AsyncValue<List<Review>>,
          List<Review>,
          FutureOr<List<Review>>,
          int
        > {
  const ReviewNotifierFamily._()
    : super(
        retry: null,
        name: r'reviewProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ReviewNotifierProvider call(int movieId) =>
      ReviewNotifierProvider._(argument: movieId, from: this);

  @override
  String toString() => r'reviewProvider';
}

abstract class _$ReviewNotifier extends $AsyncNotifier<List<Review>> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  FutureOr<List<Review>> build(int movieId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<Review>>, List<Review>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Review>>, List<Review>>,
              AsyncValue<List<Review>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
