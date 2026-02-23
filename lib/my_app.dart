import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/core.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

class MyApp extends ConsumerWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routerConfig = ref.watch(routerProvider);
    final localeAsync = ref.watch(localeProvider);

    final themeMode = ref.watch(themeProvider);

    return localeAsync.when(
      loading: () => MaterialApp(
        debugShowCheckedModeBanner: config.flavor == Flavor.dev,
        home: const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        ),
        builder: EasyLoading.init(),
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
      builder: EasyLoading.init(),
    );
  }
}
