import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';

class MovieStatsRow extends StatelessWidget {
  final MovieDetail movie;
  const MovieStatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem(context.l10n.duration, '${movie.runtime} min'),
        _buildInfoItem(context.l10n.language, 'English'),
        _buildInfoItem(context.l10n.reviews, 'PG-13'),
      ],
    );
  }

  Widget _buildInfoItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ],
    );
  }
}
