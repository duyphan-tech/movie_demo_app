import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';

class LoadMoreIndicator extends ConsumerWidget {
  const LoadMoreIndicator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoadingMore = ref.watch(
      homeProvider.select((state) => state.isLoading && state.hasValue),
    );

    if (isLoadingMore) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return const SizedBox.shrink();
  }
}
