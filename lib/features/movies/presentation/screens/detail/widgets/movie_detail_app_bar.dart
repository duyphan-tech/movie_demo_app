import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/app_bar_background.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetail movie;

  const MovieDetailAppBar({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.more_horiz, color: Colors.white),
          onPressed: () {
            context.push(RouterPath.rated);
          },
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: AppBarBackground(
          imageUrl:
              '${AppConstants.imageUrl500}${movie.backdropPath ?? movie.posterPath}',
        ),
      ),
    );
  }
}
