import 'package:app_links/app_links.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_demo_app/core/deeplink/deep_link_service.dart';
import 'package:movie_demo_app/core/logger/app_logger.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';

final deepLinkStreamProvider = Provider<void>((ref) {
  final appLinks = AppLinks();

  final localStorage = ref.watch(localStorageProvider);
  final config = ref.watch(appConfigProvider).deepLinkConfig;
  final deepLinkService = DeepLinkService(localStorage: localStorage, config: config);

  final subscription = appLinks.uriLinkStream.listen(
    (Uri uri) {
      AppLogger.d('🔗🔗🔗 Received: $uri', tag: 'DeepLink');

      if (!deepLinkService.isValidDeepLink(uri)) {
        AppLogger.w('Invalid deep link: $uri', tag: 'DeepLink');
        return;
      }

      final path = deepLinkService.extractPath(uri);
      if (path == null) {
        AppLogger.w('Could not extract path from: $uri', tag: 'DeepLink');
        return;
      }

      final authState = ref.read(authProvider);
      final isLoggedIn = authState.hasValue
          ? (authState.value ?? false)
          : false;

      AppLogger.d('Auth state: isLoggedIn=$isLoggedIn', tag: 'DeepLink');

      // Luôn lưu pending deep link dù đã login hay chưa
      AppLogger.i('Saving pending deep link: $path', tag: 'DeepLink');
      ref.read(pendingDeepLinkProvider.notifier).savePendingDeepLink(path);
    },
    onError: (Object err) {
      AppLogger.e('Stream error', tag: 'DeepLink', error: err);
    },
  );

  ref.onDispose(() {
    subscription.cancel();
  });
});
