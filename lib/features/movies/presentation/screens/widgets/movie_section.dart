import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_item.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../domain/entities/movie.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MovieSection extends StatelessWidget {
  final String title;

  final AsyncValue<List<Movie>> moviesValue;

  const MovieSection({
    super.key,
    required this.title,
    required this.moviesValue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Xem tất cả', style: TextStyle(color: Colors.blue)),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: moviesValue.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) =>
                Center(child: Text('Lỗi: ${err.toString()}')),
            data: (movies) {
              return _buildData(movies);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildData(List<Movie> movies) {
    Widget item;
    if (movies.isEmpty) {
      item = const Center(child: Text("Không có phim"));
    } else {
      item = ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: movies.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final movie = movies[index];
          return MovieItem(movie: movie);
        },
      );
    }
    return item;
  }
}
