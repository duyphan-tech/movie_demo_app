import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/search_provider.dart';

import 'search_no_results_state.dart';
import 'search_results_list.dart';

class SearchDataContent extends ConsumerWidget {
  const SearchDataContent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moviesLength = ref.watch(
      searchProvider.select((s) => s.value?.movies.length ?? 0),
    );

    if (moviesLength == 0) {
      return const SearchNoResultsState();
    }

    return const SearchResultsList();
  }
}
