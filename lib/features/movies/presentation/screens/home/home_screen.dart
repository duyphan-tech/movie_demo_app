import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_demo_app/core/utils/extensions/l10n.dart';
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

    useEffect(() {
      void onScroll() {
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200) {
          final homeState = ref.read(homeProvider);

          if (!homeState.isLoading && !homeState.hasError) {
            ref.read(homeProvider.notifier).loadMorePopular();
          }
        }
      }

      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, [scrollController]);

    ref.listen(homeProvider, (previous, next) {
      if (next.hasError && !next.isLoading) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${context.l10n.error}: ${next.error}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    });

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(
        title: Text(context.l10n.movieOverviewTitle),
        actions: [
          AnimatedRefreshButton(
            onRefresh: () async {
              return ref.refresh(homeProvider.future);
            },
          ),
        ],
      ),
      body: isInitialLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      MovieSection(
                        title: context.l10n.nowPlaying,
                        category: MovieCategory.nowPlaying,
                      ),
                      SizedBox(height: 10),
                      MovieSection(
                        title: context.l10n.topRated,
                        category: MovieCategory.topRated,
                      ),
                      SizedBox(height: 10),
                      MovieSection(
                        title: context.l10n.upcoming,
                        category: MovieCategory.upcoming,
                      ),
                      SizedBox(height: 10),
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

                const SliverToBoxAdapter(child: SizedBox(height: 20)),
              ],
            ),
    );
  }
}
