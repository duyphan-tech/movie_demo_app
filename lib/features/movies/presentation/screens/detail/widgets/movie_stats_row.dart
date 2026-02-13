import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

class MovieStatsRow extends StatelessWidget {
  final MovieDetail movie;
  const MovieStatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem(textTheme, colorScheme, context.l10n.duration, '${movie.runtime} min'),
        _buildInfoItem(textTheme, colorScheme, context.l10n.language, 'English'),
        _buildInfoItem(textTheme, colorScheme, context.l10n.reviews, 'PG-13'),
      ],
    );
  }

  Widget _buildInfoItem(TextTheme textTheme, ColorScheme colorScheme, String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textTheme.labelMedium?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 4),
        Text(value, style: textTheme.bodyMedium),
      ],
    );
  }
}
