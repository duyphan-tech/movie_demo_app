import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movie_demo_app/core/deeplink/deep_link_service.dart';
import 'package:movie_demo_app/core/providers/pending_deep_link_provider.dart';
import 'package:movie_demo_app/core/providers/storage_providers.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';

final deepLinkStreamProvider = Provider<void>((ref) {
  final appLinks = AppLinks();
  DeepLinkService? deepLinkService;

  final localStorage = ref.watch(localStorageProvider);
  final config = ref.watch(appConfigProvider).deepLinkConfig;
  deepLinkService = DeepLinkService(localStorage: localStorage, config: config);

  final subscription = appLinks.uriLinkStream.listen(
    (Uri uri) {
      debugPrint('🔗🔗🔗 DeepLinkStream - Received: $uri');

      if (!deepLinkService!.isValidDeepLink(uri)) {
        debugPrint('🔗 DeepLinkStream - Invalid deep link');
        return;
      }

      final path = deepLinkService.extractPath(uri);
      if (path == null) {
        debugPrint('🔗 DeepLinkStream - Could not extract path');
        return;
      }

      final authState = ref.read(authProvider);
      final isLoggedIn = authState.hasValue
          ? (authState.value ?? false)
          : false;

      debugPrint('🔗 DeepLinkStream - Auth state: isLoggedIn=$isLoggedIn');

      if (isLoggedIn) {
        debugPrint('🔗 DeepLinkStream - Logged in, saving pending: $path');
        ref.read(pendingDeepLinkProvider.notifier).savePendingDeepLink(path);
      } else {
        debugPrint('🔗 DeepLinkStream - Not logged in, saving pending: $path');
        ref.read(pendingDeepLinkProvider.notifier).savePendingDeepLink(path);
        debugPrint('🔗 DeepLinkStream - Pending link saved!');
      }
    },
    onError: (Object err) {
      debugPrint('🔗 DeepLinkStream - Error: $err');
    },
  );

  ref.onDispose(() {
    subscription.cancel();
  });
});
