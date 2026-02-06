import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_account_state_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/movie_provider.dart';
import 'package:movie_demo_app/features/movies/providers/movie_providers.dart';

class RatingDialog extends ConsumerStatefulWidget {
  final double initialRating;
  const RatingDialog({super.key, required this.initialRating});

  @override
  ConsumerState<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends ConsumerState<RatingDialog> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    final movieId = ref.read(currentMovieIdProvider);

    return AlertDialog(
      title: const Text('Đánh giá phim'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${_currentRating.toStringAsFixed(1)} / 10',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 10),
          Slider(
            value: _currentRating,
            min: 1.0,
            max: 10.0,
            divisions: 18,
            label: _currentRating.toString(),
            activeColor: Colors.amber,
            onChanged: (value) => setState(() => _currentRating = value),
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
                    SnackBar(content: Text('Lỗi xóa: ${error.message}')),
                  );
                  ref.invalidate(movieAccountStateProvider(movieId));
                },
                (success) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Đã xóa đánh giá!')),
                  );
                },
              );
            }
            ref.invalidate(movieAccountStateProvider(movieId));
          },
          style: TextButton.styleFrom(foregroundColor: Colors.red),
          child: const Text('Xóa'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Hủy', style: TextStyle(color: Colors.grey)),
        ),
        TextButton(
          onPressed: () async {
            Navigator.pop(context);
            ref
                .read(movieAccountStateProvider(movieId).notifier)
                .setLocalRating(_currentRating);
            await ref
                .read(movieRepositoryProvider)
                .rateMovie(movieId: movieId, value: _currentRating);
          },
          child: const Text(
            'Gửi',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
