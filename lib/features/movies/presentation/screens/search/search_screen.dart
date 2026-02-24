import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/hooks/use_debounce.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/search_provider.dart';

import 'widgets/widgets.dart';

class SearchScreen extends HookConsumerWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final searchController = useTextEditingController();
    final focusNode = useFocusNode();

    useEffect(() {
      focusNode.requestFocus();
      return null;
    }, const []);

    final debouncedSearch = useDebounce(
      () => ref.read(searchProvider.notifier).search(searchController.text),
      duration: const Duration(milliseconds: 500),
    );

    void onSearchChanged(String query) {
      if (query.isNotEmpty) {
        debouncedSearch();
      } else {
        ref.read(searchProvider.notifier).clear();
      }
    }

    void clearSearch() {
      searchController.clear();
      ref.read(searchProvider.notifier).clear();
      focusNode.requestFocus();
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: CustomScrollView(
        slivers: [
          SearchAppBar(
            searchController: searchController,
            focusNode: focusNode,
            onChanged: onSearchChanged,
            onClear: clearSearch,
          ),
          SearchQueryBuilder(
            controller: searchController,
            builder: (context, query) => SearchContent(searchQuery: query),
          ),
        ],
      ),
    );
  }
}
