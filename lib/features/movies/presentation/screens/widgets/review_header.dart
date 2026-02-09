import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/review_provider.dart';

class ReviewHeader extends ConsumerWidget {
  const ReviewHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ref.watch(currentMovieIdProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.reviews,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF110E47),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, size: 20, color: Colors.grey),
            onPressed: () {
              ref.refresh(reviewProvider(movieId));
              ref.refresh(movieAccountStateProvider(movieId));
            },
          ),
        ],
      ),
    );
  }
}
