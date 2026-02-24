import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SearchShimmerItem extends StatelessWidget {
  const SearchShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: AspectRatio(
            aspectRatio: 2 / 3,
            child: Container(
              color: colorScheme.surfaceContainerHighest,
            ),
          ),
        ),
        const Gap(8),
        Container(
          height: 14,
          width: double.infinity,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const Gap(4),
        Container(
          height: 12,
          width: 50,
          decoration: BoxDecoration(
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}
