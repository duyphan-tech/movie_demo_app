import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/providers/locale_provider.dart';
import 'package:movie_demo_app/core/providers/theme_provider.dart';
import 'package:movie_demo_app/core/router/app_router.dart';
import 'package:movie_demo_app/core/theme/app_theme.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

import 'core/configs/app_config.dart';

class MyApp extends ConsumerWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routerConfig = ref.watch(routerProvider);
    final localeAsync = ref.watch(localeProvider);

    final themeMode = ref.watch(themeProvider);

    return localeAsync.when(
      loading: () => const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),

      error: (err, stack) => _buildMaterialApp(
        const Locale('vi'),
        routerConfig,
        config,
        themeMode,
      ),

      data: (locale) =>
          _buildMaterialApp(locale, routerConfig, config, themeMode),
    );
  }

  Widget _buildMaterialApp(
    Locale locale,
    GoRouter router,
    AppConfig config,
    ThemeMode themeMode,
  ) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: config.flavor == Flavor.dev,

      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
