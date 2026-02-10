import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
import 'package:movie_demo_app/core/utils/hooks/use_infinite_scroll.dart';
import 'package:movie_demo_app/core/utils/widgets/load_more_indicator.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/home_drawer.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/movie_section.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/home/widgets/popular_movies_grid.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/animated_refresh_button.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final isInitialLoading = ref.watch(
      homeProvider.select((value) => value.isLoading && !value.hasValue),
    );

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
            content: Text('${context.l10n.error}: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    final onRefresh = useCallback(() async {
      // Hỗ trợ UX: Đợi ít nhất 1 giây để người dùng kịp nhìn thấy hiệu ứng loading
      // Đồng thời gọi lệnh refresh provider
      await Future.wait([
        Future.delayed(const Duration(seconds: 1)),
        ref.refresh(homeProvider.future),

        // LƯU Ý: Nếu MovieSection dùng provider riêng (ví dụ: nowPlayingProvider),
        // bạn nên thêm vào đây để refresh tất cả cùng lúc:
        // ref.refresh(nowPlayingProvider.future),
        // ref.refresh(topRatedProvider.future),
      ]);
    }, []);

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text(context.l10n.movieOverviewTitle),
        actions: [AnimatedRefreshButton(onRefresh: onRefresh)],
      ),
      body: isInitialLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: onRefresh,
              color: Colors.black,
              backgroundColor: Colors.white,
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
                        Gap(10),
                        MovieSection(
                          title: context.l10n.topRated,
                          category: MovieCategory.topRated,
                        ),
                        Gap(10),
                        MovieSection(
                          title: context.l10n.upcoming,
                          category: MovieCategory.upcoming,
                        ),
                        Gap(10),
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              context.l10n.popular,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
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
