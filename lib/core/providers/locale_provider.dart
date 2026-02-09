import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/auth/providers/auth_providers.dart';
import 'package:movie_demo_app/l10n/arb/app_localizations.dart';

const _kLocaleKey = 'APP_LOCALE';

class LocaleNotifier extends AsyncNotifier<Locale> {
  @override
  Future<Locale> build() async {
    final prefs = ref.watch(sharedPreferencesAsyncProvider);
    final savedCode = await prefs.getString(_kLocaleKey);

    if (savedCode != null) {
      return Locale(savedCode);
    }
    return const Locale('en');
  }

  Future<void> setLocale(Locale locale) async {
    if (state.value == locale) return;

    state = AsyncData(locale);

    final prefs = ref.read(sharedPreferencesAsyncProvider);
    await prefs.setString(_kLocaleKey, locale.languageCode);
  }

  String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'vi':
        return 'Tiếng Việt';
      default:
        return code;
    }
  }

  List<Locale> get supportedLocales => AppLocalizations.supportedLocales;
}

final localeProvider = AsyncNotifierProvider<LocaleNotifier, Locale>(() {
  return LocaleNotifier();
});
