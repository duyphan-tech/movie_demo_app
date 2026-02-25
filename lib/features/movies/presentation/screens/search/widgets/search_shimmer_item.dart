import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/theme/theme.dart';

class SearchShimmerItem extends StatelessWidget {
  const SearchShimmerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: context.radiusSm,
          child: Container(
            height: 160,
            color: context.bgSurfaceVariant,
          ),
        ),
        context.gapSm,
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.bgSurfaceVariant,
              borderRadius: context.radiusXs,
            ),
          ),
        ),
        // Year shimmer
        Container(
          height: 12,
          width: 50,
          margin: const EdgeInsets.only(top: 4),
          decoration: BoxDecoration(
            color: context.textPrimary.withValues(alpha: 0.3),
            borderRadius: context.radiusXs,
          ),
        ),
      ],
    );
  }
}
