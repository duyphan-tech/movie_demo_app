import 'dart:async';

import 'package:app_links/app_links.dart';

import 'package:movie_demo_app/core/configs/app_config.dart';
import 'package:movie_demo_app/core/local/local_storage_service.dart';
import 'package:movie_demo_app/core/local/storage_keys.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';

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
      AppLogger.d('Initial URI: $initialUri', tag: 'DeepLinkService');

      _linkSubscription = _appLinks.uriLinkStream.listen(
        (Uri uri) {
          AppLogger.d('Stream URI: $uri', tag: 'DeepLinkService');
          _handleDeepLink(uri);
        },
        onError: (Object err) {
          AppLogger.e('Stream error', tag: 'DeepLinkService', error: err);
        },
      );

      return initialUri;
    } catch (e, stackTrace) {
      AppLogger.e('Init error', tag: 'DeepLinkService', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  /// Xử lý deep link
  void _handleDeepLink(Uri uri) {
    AppLogger.d('Handling: $uri', tag: 'DeepLinkService');
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
      AppLogger.i('Saved pending deep link: $path', tag: 'DeepLinkService');
    } catch (e, stackTrace) {
      AppLogger.e('Error saving pending deep link', tag: 'DeepLinkService', error: e, stackTrace: stackTrace);
    }
  }

  Future<String?> getPendingDeepLink() async {
    try {
      return await _localStorage.getString(StorageKeys.pendingDeepLinkKey);
    } catch (e, stackTrace) {
      AppLogger.e('Error getting pending deep link', tag: 'DeepLinkService', error: e, stackTrace: stackTrace);
      return null;
    }
  }

  Future<void> clearPendingDeepLink() async {
    try {
      await _localStorage.remove(StorageKeys.pendingDeepLinkKey);
      AppLogger.i('Cleared pending deep link', tag: 'DeepLinkService');
    } catch (e, stackTrace) {
      AppLogger.e('Error clearing pending deep link', tag: 'DeepLinkService', error: e, stackTrace: stackTrace);
    }
  }

  void dispose() {
    _linkSubscription?.cancel();
  }
}
