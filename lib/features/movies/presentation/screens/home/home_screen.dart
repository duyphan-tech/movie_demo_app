import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/core.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/home_drawer.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/movie_section.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/popular_movies_grid.dart';
// import 'package:movie_demo_app/features/movies/presentation/screens/widgets/animated_refresh_button.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final scrollController = useScrollController();

    // useEffect(() {
    //   void onScroll() {
    //     if (scrollController.isBottom) {
    //       ref.read(homeProvider.notifier).loadMorePopular();
    //     }
    //   }

    //   scrollController.addListener(onScroll);
    //   return () => scrollController.removeListener(onScroll);
    // }, [scrollController]);

    useInfiniteScroll(
      controller: scrollController,
      onLoadMore: () => ref.read(homeProvider.notifier).loadMorePopular(),
    );

    ref.listen(homeProvider, (previous, next) {
      if (next.hasError && !next.isLoading && next.hasValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              '${context.l10n.error}: ${next.error}',
              style: textTheme.bodyMedium?.copyWith(color: colorScheme.onError),
            ),
            backgroundColor: colorScheme.error,
          ),
        );
      }
    });

    final onRefresh = useCallback(() async {
      await Future.wait([
        Future.delayed(const Duration(seconds: 1)),
        ref.refresh(homeProvider.future),
      ]);
    }, []);

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text(context.l10n.movieOverviewTitle),
        actions: [
          // AnimatedRefreshButton(onRefresh: onRefresh),
          GestureDetector(
            onTap: () => context.pushNamed(RouterName.search),
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(AppIcon.search),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: onRefresh,
        color: colorScheme.onSurface,
        backgroundColor: colorScheme.surface,
        edgeOffset: 0,
        child: CustomScrollView(
          controller: scrollController,
          physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics(),
          ),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  MovieSection(
                    title: context.l10n.nowPlaying,
                    category: MovieCategory.nowPlaying,
                  ),
                  const Gap(10),
                  MovieSection(
                    title: context.l10n.topRated,
                    category: MovieCategory.topRated,
                  ),
                  const Gap(10),
                  MovieSection(
                    title: context.l10n.upcoming,
                    category: MovieCategory.upcoming,
                  ),
                  const Gap(10),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        context.l10n.popular,
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const PopularMoviesGrid(),

            const SliverToBoxAdapter(child: LoadMoreIndicator()),

            const SliverToBoxAdapter(child: Gap(20)),
          ],
        ),
      ),
    );
  }
}
