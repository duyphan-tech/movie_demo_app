import 'package:flutter/material.dart';
import 'package:movie_demo_app/features/movies/domain/entities/genre.dart';

class MovieGenresList extends StatelessWidget {
  final List<Genre> genres;

  const MovieGenresList({super.key, required this.genres});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: genres.map((genre) {

        return Chip(
          label: Text(
            genre.name.toUpperCase(),
            style: const TextStyle(fontSize: 10, color: Colors.blue),
          ),
          backgroundColor: Colors.blue.withOpacity(0.1),
          shape: const StadiumBorder(),
          side: BorderSide.none,
        );
      }).toList(),
    );
  }
}