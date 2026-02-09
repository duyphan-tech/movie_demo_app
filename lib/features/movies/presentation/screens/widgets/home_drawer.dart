import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/locale_provider.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/favorite_movies_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated_movies_screen_screen.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localeAsync = ref.watch(localeProvider);
    final currentLocale = localeAsync.value ?? const Locale('en');

    final localeNotifier = ref.read(localeProvider.notifier);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF0d253f)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Text(
                "D",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0d253f),
                ),
              ),
            ),
            accountName: const Text(
              "Duy Phan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("duyphan@example.com"),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: Text(context.l10n.homePage),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: Text(context.l10n.favoriteMovies),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoriteMoviesScreen(),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: Text(context.l10n.ratedMovies),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RatedMoviesScreen(),
                      ),
                    );
                  },
                ),

                ExpansionTile(
                  leading: const Icon(Icons.language, color: Colors.blue),
                  title: Text(context.l10n.language),
                  subtitle: Text(
                    localeNotifier.getLanguageName(currentLocale.languageCode),
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                  children: localeNotifier.supportedLocales.map((locale) {
                    final isSelected =
                        currentLocale.languageCode == locale.languageCode;

                    return ListTile(
                      contentPadding: const EdgeInsets.only(
                        left: 72,
                        right: 24,
                      ),
                      title: Text(
                        localeNotifier.getLanguageName(locale.languageCode),
                      ),
                      trailing: isSelected
                          ? const Icon(
                              Icons.check,
                              color: Colors.green,
                              size: 20,
                            )
                          : null,
                      selected: isSelected,
                      onTap: () {
                        ref.read(localeProvider.notifier).setLocale(locale);
                        Navigator.pop(context);
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.grey),
            title: Text(context.l10n.logout),
            onTap: () {
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: Text(context.l10n.logout),
                  content: Text(context.l10n.logoutConfirmation),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: Text(context.l10n.cancel),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        ref.read(authControllerProvider.notifier).logout();
                      },
                      child: Text(
                        context.l10n.agree,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
