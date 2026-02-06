// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_account_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MovieAccountState)
const movieAccountStateProvider = MovieAccountStateFamily._();

final class MovieAccountStateProvider
    extends $AsyncNotifierProvider<MovieAccountState, AccountState> {
  const MovieAccountStateProvider._({
    required MovieAccountStateFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'movieAccountStateProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$movieAccountStateHash();

  @override
  String toString() {
    return r'movieAccountStateProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  MovieAccountState create() => MovieAccountState();

  @override
  bool operator ==(Object other) {
    return other is MovieAccountStateProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$movieAccountStateHash() => r'395c60c0403eb4d4efc1e1a92218b06b3addadc1';

final class MovieAccountStateFamily extends $Family
    with
        $ClassFamilyOverride<
          MovieAccountState,
          AsyncValue<AccountState>,
          AccountState,
          FutureOr<AccountState>,
          int
        > {
  const MovieAccountStateFamily._()
    : super(
        retry: null,
        name: r'movieAccountStateProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  MovieAccountStateProvider call(int movieId) =>
      MovieAccountStateProvider._(argument: movieId, from: this);

  @override
  String toString() => r'movieAccountStateProvider';
}

abstract class _$MovieAccountState extends $AsyncNotifier<AccountState> {
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
