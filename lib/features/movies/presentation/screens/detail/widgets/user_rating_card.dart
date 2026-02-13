import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/detail/widgets/rating_dialog.dart';

class UserRatingCard extends ConsumerWidget {
  const UserRatingCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
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
            color: colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: colorScheme.outlineVariant),
          ),
          child: Row(
            children: [
              Icon(Icons.star, color: colorScheme.secondary, size: 28),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      myRating != null
                          ? context.l10n.yourRating
                          : context.l10n.unrated,
                      style: textTheme.titleSmall,
                    ),
                    if (myRating != null)
                      Text(
                        "${myRating.toStringAsFixed(1)}/10",
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w900,
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
                  backgroundColor: colorScheme.surfaceContainerLow,
                  foregroundColor: colorScheme.secondary,
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
