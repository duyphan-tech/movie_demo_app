import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:movie_demo_app/core/configs/app_config.dart';
import 'package:movie_demo_app/core/deeplink/deep_link_service.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';

part 'pending_deep_link_provider.g.dart';

final appConfigProvider = Provider<AppConfig>((ref) {
  throw UnimplementedError('AppConfig chưa được khởi tạo');
});

@riverpod
class PendingDeepLinkNotifier extends _$PendingDeepLinkNotifier {
  DeepLinkService? _deepLinkService;
  DeepLinkConfig? _config;

  @override
  Future<String?> build() async {
    final localStorage = ref.watch(localStorageProvider);
    final config = ref.watch(appConfigProvider).deepLinkConfig;
    _config = config;

    final deepLinkService = DeepLinkService(
      localStorage: localStorage,
      config: config,
    );
    _deepLinkService = deepLinkService;

    final pendingLink = await deepLinkService.getPendingDeepLink();
    return pendingLink;
  }

  Future<void> savePendingDeepLink(String path) async {
    final service = _deepLinkService;
    if (service == null) {
      AppLogger.w('DeepLinkService is null', tag: 'PendingDeepLink');
      return;
    }

    AppLogger.d('Saving path: $path', tag: 'PendingDeepLink');
    state = const AsyncLoading();
    await service.savePendingDeepLink(path);
    state = AsyncData(path);
    AppLogger.i('Saved pending deep link: $path', tag: 'PendingDeepLink');
  }

  Future<void> clearPendingDeepLink() async {
    final service = _deepLinkService;
    if (service == null) return;

    await service.clearPendingDeepLink();
    state = const AsyncData(null);
  }

  Future<String?> initializeAndCheckDeepLink() async {
    final service = _deepLinkService;
    if (service == null) return null;

    final initialUri = await service.initialize();

    if (initialUri != null && _isValidDeepLink(initialUri)) {
      final path = _extractPath(initialUri);
      if (path != null) {
        await savePendingDeepLink(path);
        return path;
      }
    }

    return null;
  }

  bool _isValidDeepLink(Uri uri) {
    if (_config == null) return false;
    return _deepLinkService?.isValidDeepLink(uri) ?? false;
  }

  String? _extractPath(Uri uri) {
    return _deepLinkService?.extractPath(uri);
  }
}

@riverpod
bool hasPendingDeepLink(Ref ref) {
  final pendingLink = ref.watch(pendingDeepLinkProvider);
  return pendingLink.when(
    data: (link) => link != null && link.isNotEmpty,
    loading: () => false,
    error: (_, __) => false,
  );
}
