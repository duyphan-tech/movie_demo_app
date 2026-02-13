import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/providers/locale_provider.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/favorite/favorite_movies_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated/rated_movies_screen_screen.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final localeAsync = ref.watch(localeProvider);
    final currentLocale = localeAsync.value ?? const Locale('en');

    final localeNotifier = ref.read(localeProvider.notifier);
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: colorScheme.surfaceContainerHighest),
            currentAccountPicture: CircleAvatar(
              backgroundColor: colorScheme.onSurfaceVariant,
              child: Text(
                "D",
                style: textTheme.titleLarge?.copyWith(
                  color: colorScheme.surfaceContainerHighest,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            accountName: Text(
              "Duy Phan",
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "duyphan@example.com",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant.withAlpha(179),
              ),
            ),
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
                  leading: Icon(Icons.favorite, color: colorScheme.primary),
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
                  leading: Icon(Icons.star, color: colorScheme.secondary),
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
                  leading: Icon(
                    Icons.language,
                    color: colorScheme.secondary,
                  ),
                  title: Text(context.l10n.language),
                  subtitle: Text(
                    localeNotifier.getLanguageName(currentLocale.languageCode),
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
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
                          ? Icon(
                              Icons.check,
                              color: colorScheme.primary,
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
            leading: Icon(Icons.logout, color: colorScheme.onSurfaceVariant),
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
                        ref.read(authProvider.notifier).logout();
                      },
                      child: Text(
                        context.l10n.agree,
                        style: TextStyle(color: colorScheme.error),
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
