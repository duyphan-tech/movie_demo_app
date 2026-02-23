import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';

class MovieOverview extends StatelessWidget {
  final String overview;
  const MovieOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.l10n.description,
          style: textTheme.titleLarge,
        ),
        const Gap(8),
        Text(
          overview,
          style: textTheme.bodyMedium?.copyWith(
            height: 1.5,
            color: colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
