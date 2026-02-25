import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class SearchNoResultsState extends StatelessWidget {
  const SearchNoResultsState({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_filter_outlined,
              size: 80,
              color: context.textTertiary.withValues(alpha: 0.2),
            ),
            context.gapLg,
            Text(
              context.l10n.noMoviesFound,
              style: context.bodyLg.copyWith(
                color: context.textSecondary,
              ),
            ),
            context.gapSm,
            Text(
              context.l10n.tryDifferentKeyword,
              style: context.bodySm.copyWith(
                color: context.textTertiary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
