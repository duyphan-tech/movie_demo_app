import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/providers/locale_provider.dart';
import 'package:movie_demo_app/core/router/app_router.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

import 'core/configs/app_config.dart';

class MyApp extends ConsumerWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routerConfig = ref.watch(routerProvider);
    final localeAsync = ref.watch(localeProvider);

    return localeAsync.when(
      loading: () => const MaterialApp(
        home: Scaffold(body: Center(child: CircularProgressIndicator())),
      ),

      error: (err, stack) =>
          _buildMaterialApp(const Locale('vi'), routerConfig, config),

      data: (locale) => _buildMaterialApp(locale, routerConfig, config),
    );
  }

  Widget _buildMaterialApp(Locale locale, GoRouter router, AppConfig config) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: config.flavor == Flavor.dev,

      locale: locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      routerConfig: router,
    );
  }
}
