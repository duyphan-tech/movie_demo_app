import 'package:flutter/material.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/search/widgets/search_shimmer_item.dart';

class SearchLoadingGrid extends StatelessWidget {
  final int itemCount;

  const SearchLoadingGrid({
    super.key,
    this.itemCount = 12,
  });

  @override
  Widget build(BuildContext context) {
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
          (context, index) => const SearchShimmerItem(),
          childCount: itemCount,
        ),
      ),
    );
  }
}
