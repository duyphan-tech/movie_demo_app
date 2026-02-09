import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie_detail.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/favorite_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_detail_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/review_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/app_bar_background.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/animated_refresh_button.dart';

class MovieDetailAppBar extends ConsumerWidget {
  final MovieDetail movie;

  const MovieDetailAppBar({super.key, required this.movie});

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
        AnimatedRefreshButton(
          color: Colors.white,
          onRefresh: () async {
            final int id = movie.id;
            await Future.wait([
              ref.refresh(movieDetailProvider(id).future),

              ref.refresh(reviewProvider(id).future),

              ref.refresh(movieAccountStateProvider(id).future),
              ref.read(favoritesProvider.notifier).checkFavoriteStatus(id),
            ]);
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
