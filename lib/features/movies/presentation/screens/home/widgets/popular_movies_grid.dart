import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';

class PopularMoviesGrid extends ConsumerWidget {
  const PopularMoviesGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final popularState = ref.watch(
      homeProvider.select((state) => state.value?.popular),
    );

    if (popularState == null) {
      return const SliverToBoxAdapter(child: SizedBox());
    }

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        delegate: SliverChildBuilderDelegate((context, index) {
          final movie = popularState[index];
          return GestureDetector(
            onTap: () =>
                context.push(RouterPath.details, extra: {'id': movie.id}),
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomNetworkImage(
                    imageUrl: '${AppConstants.imageUrl500}${movie.posterPath}',
                    fit: BoxFit.cover,
                    borderRadius: 12,
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: FavoriteButton(movieId: movie.id, color: colorScheme.primary),
                ),
              ],
            ),
          );
        }, childCount: popularState.length),
      ),
    );
  }
}
