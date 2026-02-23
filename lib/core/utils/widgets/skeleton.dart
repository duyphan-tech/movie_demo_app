import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;

  const Skeleton({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 8,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surfaceContainerHigh,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}

class MovieItemSkeleton extends StatelessWidget {
  const MovieItemSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton(width: 120, height: 140, borderRadius: 8),
        Gap(4),
        Skeleton(width: 100, height: 16, borderRadius: 4),
      ],
    );
  }
}

class MovieSectionSkeleton extends StatelessWidget {
  const MovieSectionSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header skeleton
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Skeleton(width: 120, height: 24, borderRadius: 4),
              Skeleton(width: 60, height: 16, borderRadius: 4),
            ],
          ),
        ),
        // List skeleton
        SizedBox(
          height: 160,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            separatorBuilder: (_, __) => const Gap(12),
            itemBuilder: (_, __) => const MovieItemSkeleton(),
          ),
        ),
      ],
    );
  }
}

class MovieGridSkeleton extends StatelessWidget {
  final int itemCount;

  const MovieGridSkeleton({super.key, this.itemCount = 6});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surfaceContainerHigh,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: itemCount,
        itemBuilder: (_, __) => Container(
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class MovieDetailSkeleton extends StatelessWidget {
  const MovieDetailSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Shimmer.fromColors(
      baseColor: colorScheme.surfaceContainerHighest,
      highlightColor: colorScheme.surfaceContainerHigh,
      child: CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          // App bar skeleton
          SliverToBoxAdapter(
            child: Container(
              height: 300,
              color: colorScheme.surfaceContainerHighest,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  const Skeleton(
                    width: double.infinity,
                    height: 28,
                    borderRadius: 4,
                  ),
                  const Gap(8),
                  // Rating
                  const Skeleton(width: 100, height: 20, borderRadius: 4),
                  const Gap(16),
                  // Genres
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      const Gap(8),
                      Container(
                        width: 80,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ],
                  ),
                  const Gap(24),
                  // Stats
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildStatSkeleton(colorScheme),
                      _buildStatSkeleton(colorScheme),
                      _buildStatSkeleton(colorScheme),
                    ],
                  ),
                  const Gap(24),
                  // Description title
                  const Skeleton(width: 100, height: 24, borderRadius: 4),
                  const Gap(8),
                  // Description lines
                  const Skeleton(
                    width: double.infinity,
                    height: 16,
                    borderRadius: 4,
                  ),
                  const Gap(4),
                  const Skeleton(
                    width: double.infinity,
                    height: 16,
                    borderRadius: 4,
                  ),
                  const Gap(4),
                  const Skeleton(width: 200, height: 16, borderRadius: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatSkeleton(ColorScheme colorScheme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 60,
          height: 14,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Gap(4),
        Container(
          width: 80,
          height: 18,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
