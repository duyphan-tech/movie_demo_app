import 'package:flutter/material.dart';

class MovieOverview extends StatelessWidget {
  final String overview;

  const MovieOverview({super.key, required this.overview});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Description',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF110E47),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          overview,
          style: const TextStyle(color: Colors.grey, height: 1.5),
        ),
      ],
    );
  }
}