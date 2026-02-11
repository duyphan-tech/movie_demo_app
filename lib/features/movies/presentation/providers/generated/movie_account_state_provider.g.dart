// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../movie_account_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieAccountStateNotifier)
const movieAccountStateProvider = MovieAccountStateNotifierFamily._();

final class MovieAccountStateNotifierProvider
    extends $AsyncNotifierProvider<MovieAccountStateNotifier, AccountState> {
  const MovieAccountStateNotifierProvider._({
    required MovieAccountStateNotifierFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieAccountStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieAccountStateNotifierHash();

  @override
  String toString() {
    return r'movieAccountStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MovieAccountStateNotifier create() => MovieAccountStateNotifier();

  @override
  bool operator ==(Object other) {
    return other is MovieAccountStateNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieAccountStateNotifierHash() =>
    r'0edb6956e0131c2248a23702e14ce4082cf162c8';

final class MovieAccountStateNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieAccountStateNotifier,
          AsyncValue<AccountState>,
          AccountState,
          FutureOr<AccountState>,
          int
        > {
  const MovieAccountStateNotifierFamily._()
    : super(
        retry: null,
        name: r'movieAccountStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieAccountStateNotifierProvider call(int movieId) =>
      MovieAccountStateNotifierProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieAccountStateProvider';
}

abstract class _$MovieAccountStateNotifier
    extends $AsyncNotifier<AccountState> {
  late final _$args = ref.$arg as int;
  int get movieId => _$args;

  FutureOr<AccountState> build(int movieId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<AccountState>, AccountState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<AccountState>, AccountState>,
              AsyncValue<AccountState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
