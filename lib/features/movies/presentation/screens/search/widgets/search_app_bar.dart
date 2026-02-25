import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/theme/theme.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_search_field.dart';

class SearchAppBar extends StatelessWidget {
  final TextEditingController searchController;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const SearchAppBar({
    super.key,
    required this.searchController,
    required this.focusNode,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      floating: true,
      snap: true,
      backgroundColor: context.bgSurface,
      foregroundColor: context.textPrimary,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: context.textPrimary,
        ),
        onPressed: () => context.pop(),
      ),
      title: CustomSearchField(
        controller: searchController,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: (query) => onChanged(query),
        textInputAction: TextInputAction.search,
        hintText: context.l10n.searchMoviesHint,
        suffixIcon: HookBuilder(
          builder: (context) {
            final hasText = useListenableSelector(
              searchController,
              () => searchController.text.isNotEmpty,
            );

            if (!hasText) return const SizedBox.shrink();

            return IconButton(
              icon: Icon(
                Icons.clear,
                color: context.textSecondary,
              ),
              onPressed: onClear,
            );
          },
        ),
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          height: 1,
          color: context.borderColor.withValues(alpha: 0.2),
        ),
      ),
    );
  }
}
