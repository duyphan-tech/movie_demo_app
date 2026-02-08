import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/app_router.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

import 'core/configs/app_config.dart';

final localeProvider = StateProvider<Locale>((ref) {
  return const Locale('en');
});

class MyApp extends ConsumerWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routerConfig = ref.watch(routerProvider);
    final currentLocale = ref.watch(localeProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: config.flavor == Flavor.dev,
      locale: currentLocale,
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

      routerConfig: routerConfig,
    );
  }
}
