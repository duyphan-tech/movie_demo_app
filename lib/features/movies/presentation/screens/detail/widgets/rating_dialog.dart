import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

class RatingDialog extends HookConsumerWidget {
  final double initialRating;
  const RatingDialog({super.key, required this.initialRating});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final movieId = ref.read(currentMovieIdProvider);
    final currentRating = useState(initialRating);

    return AlertDialog(
      title: Text(context.l10n.movieReviews),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${currentRating.value.toStringAsFixed(1)} / 10',
            style: textTheme.headlineMedium?.copyWith(
              color: colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Slider(
            value: currentRating.value,
            min: 1.0,
            max: 10.0,
            divisions: 18,
            label: currentRating.value.toString(),
            activeColor: colorScheme.secondary,
            onChanged: (value) => currentRating.value = value,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            ref
                .read(movieAccountStateProvider(movieId).notifier)
                .deleteLocalRating();

            final result = await ref
                .read(movieRepositoryProvider)
                .deleteRating(movieId: movieId);

            if (context.mounted) {
              result.fold(
                (error) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        '${context.l10n.delelteError}: ${error.message}',
                      ),
                    ),
                  );
                  ref.invalidate(movieAccountStateProvider(movieId));
                },
                (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.l10n.reviewRemoved)),
                  );
                },
              );
            }
          },
          style: TextButton.styleFrom(foregroundColor: colorScheme.error),
          child: Text(context.l10n.delete),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            context.l10n.cancel,
            style: TextStyle(color: colorScheme.onSurfaceVariant),
          ),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            ref
                .read(movieAccountStateProvider(movieId).notifier)
                .setLocalRating(currentRating.value);
            await ref
                .read(movieRepositoryProvider)
                .rateMovie(movieId: movieId, value: currentRating.value);
          },
          child: Text(
            context.l10n.send,
            style: textTheme.labelLarge?.copyWith(inherit: true),
          ),
        ),
      ],
    );
  }
}
