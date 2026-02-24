import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class SearchNoResultsState extends StatelessWidget {
  const SearchNoResultsState({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              size: 80,
              color: colorScheme.onSurfaceVariant.withAlpha(51),
            ),
            const Gap(16),
            Text(
              context.l10n.noMoviesFound,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const Gap(8),
            Text(
              context.l10n.tryDifferentKeyword,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurfaceVariant.withAlpha(153),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
