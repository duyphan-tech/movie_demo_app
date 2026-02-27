// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_deep_link_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Notifier quản lý pending deep link
/// Khi app bị kill và user chưa đăng nhập, deep link sẽ được lưu lại
/// và xử lý sau khi đăng nhập thành công

@ProviderFor(PendingDeepLinkNotifier)
const pendingDeepLinkProvider = PendingDeepLinkNotifierProvider._();

/// Notifier quản lý pending deep link
/// Khi app bị kill và user chưa đăng nhập, deep link sẽ được lưu lại
/// và xử lý sau khi đăng nhập thành công
final class PendingDeepLinkNotifierProvider
    extends $AsyncNotifierProvider<PendingDeepLinkNotifier, String?> {
  /// Notifier quản lý pending deep link
  /// Khi app bị kill và user chưa đăng nhập, deep link sẽ được lưu lại
  /// và xử lý sau khi đăng nhập thành công
  const PendingDeepLinkNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pendingDeepLinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pendingDeepLinkNotifierHash();

  @$internal
  @override
  PendingDeepLinkNotifier create() => PendingDeepLinkNotifier();
}

String _$pendingDeepLinkNotifierHash() =>
    r'49b90e97f09276a4f16087768d7b278565c6f604';

/// Notifier quản lý pending deep link
/// Khi app bị kill và user chưa đăng nhập, deep link sẽ được lưu lại
/// và xử lý sau khi đăng nhập thành công

abstract class _$PendingDeepLinkNotifier extends $AsyncNotifier<String?> {
  FutureOr<String?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<String?>, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<String?>, String?>,
              AsyncValue<String?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider kiểm tra xem có pending deep link cần xử lý không

@ProviderFor(hasPendingDeepLink)
const hasPendingDeepLinkProvider = HasPendingDeepLinkProvider._();

/// Provider kiểm tra xem có pending deep link cần xử lý không

final class HasPendingDeepLinkProvider
    extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Provider kiểm tra xem có pending deep link cần xử lý không
  const HasPendingDeepLinkProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'hasPendingDeepLinkProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$hasPendingDeepLinkHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return hasPendingDeepLink(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$hasPendingDeepLinkHash() =>
    r'1045ace172725bebc7d032a084304b47901d344b';
