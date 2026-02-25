import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 80,
            color: context.textTertiary.withValues(alpha: 0.2),
          ),
          context.gapLg,
          Text(
            context.l10n.emptyList,
            style: context.bodyLg.copyWith(
              color: context.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}
