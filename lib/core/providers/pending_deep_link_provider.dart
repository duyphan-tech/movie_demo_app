import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:movie_demo_app/core/configs/app_config.dart';
import 'package:movie_demo_app/core/deeplink/deep_link_service.dart';
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
    _config = ref.watch(appConfigProvider).deepLinkConfig;
    _deepLinkService = DeepLinkService(
      localStorage: localStorage,
      config: _config!,
    );

    final pendingLink = await _deepLinkService!.getPendingDeepLink();
    return pendingLink;
  }

  Future<void> savePendingDeepLink(String path) async {
    if (_deepLinkService == null) {
      debugPrint('⚠️ PendingDeepLinkNotifier: DeepLinkService is null');
      return;
    }

    debugPrint('💾 PendingDeepLinkNotifier: Saving path: $path');
    state = const AsyncLoading();
    await _deepLinkService!.savePendingDeepLink(path);
    state = AsyncData(path);
    debugPrint('💾 PendingDeepLinkNotifier: Saved! Current state: $state');
  }

  Future<void> clearPendingDeepLink() async {
    if (_deepLinkService == null) return;

    await _deepLinkService!.clearPendingDeepLink();
    state = const AsyncData(null);
  }

  Future<String?> initializeAndCheckDeepLink() async {
    if (_deepLinkService == null) return null;

    final initialUri = await _deepLinkService!.initialize();

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
