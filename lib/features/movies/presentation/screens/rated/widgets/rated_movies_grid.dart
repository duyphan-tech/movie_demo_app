import 'package:flutter/material.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated/widgets/rated_movie_item.dart';

class RatedMoviesGrid extends StatelessWidget {
  final List<Movie> movies;

  const RatedMoviesGrid({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.65,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return RatedMovieItem(movie: movies[index]);
      },
    );
  }
}
