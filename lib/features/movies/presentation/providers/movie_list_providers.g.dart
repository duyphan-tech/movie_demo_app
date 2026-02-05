// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_list_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NowPlayingMovies)
const nowPlayingMoviesProvider = NowPlayingMoviesProvider._();

final class NowPlayingMoviesProvider
    extends $AsyncNotifierProvider<NowPlayingMovies, List<Movie>> {
  const NowPlayingMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'nowPlayingMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$nowPlayingMoviesHash();

  @$internal
  @override
  NowPlayingMovies create() => NowPlayingMovies();
}

String _$nowPlayingMoviesHash() => r'f7bacaa58c6303adc26bf91074843c1e2b316a12';

abstract class _$NowPlayingMovies extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(TopRatedMovies)
const topRatedMoviesProvider = TopRatedMoviesProvider._();

final class TopRatedMoviesProvider
    extends $AsyncNotifierProvider<TopRatedMovies, List<Movie>> {
  const TopRatedMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'topRatedMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$topRatedMoviesHash();

  @$internal
  @override
  TopRatedMovies create() => TopRatedMovies();
}

String _$topRatedMoviesHash() => r'6c72e0ac8dd98a1b80e2b08dd2bd5ca89be7c5c0';

abstract class _$TopRatedMovies extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(UpcomingMovies)
const upcomingMoviesProvider = UpcomingMoviesProvider._();

final class UpcomingMoviesProvider
    extends $AsyncNotifierProvider<UpcomingMovies, List<Movie>> {
  const UpcomingMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'upcomingMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$upcomingMoviesHash();

  @$internal
  @override
  UpcomingMovies create() => UpcomingMovies();
}

String _$upcomingMoviesHash() => r'67a6a0d61b773658ff747965f4e2d16d55fa99c5';

abstract class _$UpcomingMovies extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PopularMovies)
const popularMoviesProvider = PopularMoviesProvider._();

final class PopularMoviesProvider
    extends $AsyncNotifierProvider<PopularMovies, List<Movie>> {
  const PopularMoviesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'popularMoviesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$popularMoviesHash();

  @$internal
  @override
  PopularMovies create() => PopularMovies();
}

String _$popularMoviesHash() => r'f7aaed92b6cf8805b6fdebf687d878e873b091ab';

abstract class _$PopularMovies extends $AsyncNotifier<List<Movie>> {
  FutureOr<List<Movie>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Movie>>, List<Movie>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Movie>>, List<Movie>>,
              AsyncValue<List<Movie>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
