import 'package:flutter/material.dart';

import '../../../domain/entities/movie_detail.dart';

class MovieStatsRow extends StatelessWidget {
  final MovieDetail movie;

  const MovieStatsRow({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildInfoItem('Length', '${movie.runtime} min'),
        _buildInfoItem('Language', 'English'),
        _buildInfoItem('Rating', 'PG-13'),
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