import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/app_bar_background.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/animated_refresh_button.dart';

class MovieDetailAppBar extends ConsumerWidget {
  final MovieDetail movie;
  final Future<void> Function() onRefresh;

  const MovieDetailAppBar({
    super.key,
    required this.movie,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.black,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white),
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        AnimatedRefreshButton(color: Colors.white, onRefresh: onRefresh),
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
