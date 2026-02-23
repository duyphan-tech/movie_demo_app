import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/app_bar_background.dart';
// import 'package:movie_demo_app/features/movies/presentation/screens/widgets/animated_refresh_button.dart';

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
    final colorScheme = Theme.of(context).colorScheme;

    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: colorScheme.surface,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black.withAlpha(77),
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              context.go(RouterPath.home);
            }
          },
        ),
      ),
      actions: [
        // AnimatedRefreshButton(
        //   color: colorScheme.onSurface,
        //   onRefresh: onRefresh,
        // ),
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
