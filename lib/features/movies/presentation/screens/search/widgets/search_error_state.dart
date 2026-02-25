import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/search_provider.dart';

class SearchErrorState extends ConsumerWidget {
  final String message;
  final String query;

  const SearchErrorState({
    super.key,
    required this.message,
    required this.query,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: context.colorError,
            ),
            context.gapLg,
            Text(
              context.l10n.searchError,
              style: context.bodyLg.copyWith(color: context.colorError),
            ),
            context.gapSm,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                message,
                style: context.bodySm.copyWith(
                  color: context.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            context.gapXl,
            ElevatedButton.icon(
              onPressed: () {
                ref.read(searchProvider.notifier).search(query);
              },
              icon: const Icon(Icons.refresh),
              label: Text(context.l10n.retry),
            ),
          ],
        ),
      ),
    );
  }
}
