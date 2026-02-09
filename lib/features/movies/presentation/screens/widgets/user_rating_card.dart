import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/rating_dialog.dart';

class UserRatingCard extends ConsumerWidget {
  const UserRatingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final movieId = ref.watch(currentMovieIdProvider);
    final accountStateAsync = ref.watch(movieAccountStateProvider(movieId));

    return accountStateAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
      data: (state) {
        final myRating = state.rating;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.amber.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber.withOpacity(0.3)),
          ),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myRating != null
                          ? context.l10n.yourRating
                          : context.l10n.unrated,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF110E47),
                      ),
                    ),
                    if (myRating != null)
                      Text(
                        "${myRating.toStringAsFixed(1)}/10",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                          color: Colors.amber,
                        ),
                      ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => ProviderScope(
                      overrides: [
                        currentMovieIdProvider.overrideWithValue(movieId),
                      ],
                      child: RatingDialog(initialRating: myRating ?? 5.0),
                    ),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.amber,
                ),
                child: Text(
                  myRating != null ? context.l10n.edit : context.l10n.rate,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
