import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/search_provider.dart';

import 'search_movie_grid_item.dart';
import 'search_shimmer_item.dart';

class SearchResultsList extends ConsumerWidget {
  const SearchResultsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movies = ref.watch(
      searchProvider.select((s) => s.value?.movies ?? []),
    );
    final isLoading = ref.watch(searchProvider.select((s) => s.isLoading));
    final hasMore = ref.watch(
      searchProvider.select((s) => s.value?.hasMore ?? false),
    );

    return SliverPadding(
      padding: const EdgeInsets.all(16),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 16,
          crossAxisSpacing: 12,
          childAspectRatio: 0.50,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            if (index >= movies.length) {
              if (isLoading && hasMore) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  ref.read(searchProvider.notifier).loadMore();
                });
              }
              return const SearchShimmerItem();
            }
            return SearchMovieGridItem(movie: movies[index]);
          },
          childCount: movies.length + (isLoading && hasMore ? 1 : 0),
        ),
      ),
    );
  }
}
