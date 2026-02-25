import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/search_provider.dart';

import 'search_data_content.dart';
import 'search_error_state.dart';
import 'search_initial_state.dart';
import 'search_loading_grid.dart';

class SearchContent extends ConsumerWidget {
  const SearchContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasError = ref.watch(searchProvider.select((s) => s.hasError));
    final isLoading = ref.watch(searchProvider.select((s) => s.isLoading));
    final hasValue = ref.watch(searchProvider.select((s) => s.hasValue));
    final searchQuery = ref.watch(
      searchProvider.select((s) => s.value?.query ?? ''),
    );

    // Initial state - chưa search
    if (searchQuery.isEmpty && !hasValue) {
      return const SearchInitialState();
    }

    // Error state
    if (hasError && !isLoading) {
      final error = ref.read(searchProvider).error;
      return SearchErrorState(
        message: error.toString(),
        query: searchQuery,
      );
    }

    // Loading state - không có data
    if (isLoading && !hasValue) {
      return const SearchLoadingGrid();
    }

    // Có data - xử lý hiển thị
    return const SearchDataContent();
  }
}
