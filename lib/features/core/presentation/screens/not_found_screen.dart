import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class NotFoundScreen extends StatelessWidget {
  final String? path;

  const NotFoundScreen({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 100,
                color: colorScheme.outlineVariant,
              ),
              const Gap(24),

              Text(
                context.l10n.error404,
                style: textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: colorScheme.primary,
                  height: 1,
                ),
              ),
              const Gap(8),

              Text(
                context.l10n.pageNotFound,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),

              const Gap(12),

              Text(
                path != null
                    ? context.l10n.pathNotFound(path!)
                    : context.l10n.pageNotFoundMessage,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),

              const Gap(40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.go(RouterPath.home);
                  },
                  icon: const Icon(Icons.home_rounded),
                  label: Text(
                    context.l10n.goBackHome,
                    style: textTheme.labelLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
