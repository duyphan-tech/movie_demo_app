import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';

import 'package:movie_demo_app/core/configs/app_config.dart';
import 'package:movie_demo_app/core/local/local_storage_service.dart';
import 'package:movie_demo_app/core/local/storage_keys.dart';

class DeepLinkService {
  DeepLinkService({
    required LocalStorageService localStorage,
    required DeepLinkConfig config,
  }) : _localStorage = localStorage,
       _config = config;

  final LocalStorageService _localStorage;
  final DeepLinkConfig _config;
  final AppLinks _appLinks = AppLinks();
  StreamSubscription<Uri>? _linkSubscription;

  Future<Uri?> initialize() async {
    try {
      final Uri? initialUri = await _appLinks.getInitialLink();
      debugPrint('🔗 DeepLinkService - Initial URI: $initialUri');

      _linkSubscription = _appLinks.uriLinkStream.listen(
        (Uri uri) {
          debugPrint('🔗 DeepLinkService - Stream URI: $uri');
          _handleDeepLink(uri);
        },
        onError: (Object err) {
          debugPrint('🔗 DeepLinkService - Stream error: $err');
        },
      );

      return initialUri;
    } catch (e) {
      debugPrint('🔗 DeepLinkService - Init error: $e');
      return null;
    }
  }

  /// Xử lý deep link
  void _handleDeepLink(Uri uri) {
    debugPrint('🔗 DeepLinkService handling: $uri');
  }

  bool isValidDeepLink(Uri uri) {
    if (uri.scheme != _config.scheme) return false;

    if (_config.host != null && uri.host != _config.host) return false;

    return true;
  }

  String? extractPath(Uri uri) {
    // Kiểm tra host phù hợp với config
    final expectedHost = _config.host ?? 'details';
    if (uri.host == expectedHost) {
      final id = uri.pathSegments.isNotEmpty ? uri.pathSegments.first : null;
      if (id != null && int.tryParse(id) != null) {
        return '/details/$id';
      }
    }
    return null;
  }

  Future<void> savePendingDeepLink(String path) async {
    try {
      await _localStorage.setString(StorageKeys.pendingDeepLinkKey, path);
      debugPrint('🔗 Saved pending deep link: $path');
    } catch (e) {
      debugPrint('🔗 Error saving pending deep link: $e');
    }
  }

  Future<String?> getPendingDeepLink() async {
    try {
      return await _localStorage.getString(StorageKeys.pendingDeepLinkKey);
    } catch (e) {
      debugPrint('🔗 Error getting pending deep link: $e');
      return null;
    }
  }

  Future<void> clearPendingDeepLink() async {
    try {
      await _localStorage.remove(StorageKeys.pendingDeepLinkKey);
      debugPrint('🔗 Cleared pending deep link');
    } catch (e) {
      debugPrint('🔗 Error clearing pending deep link: $e');
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
