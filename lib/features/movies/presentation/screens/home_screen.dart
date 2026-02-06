import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/constants/app_constants.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/domain/entities/movie.dart';
import 'package:movie_demo_app/features/movies/presentation/providers/home_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/favorite_button.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/home_drawer.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_section.dart';

import '../../../auth/presentation/providers/auth_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      ref.read(homeViewModelProvider.notifier).loadMorePopular();
    }
  }

  @override
  Widget build(BuildContext context) {
    final homeStateAsync = ref.watch(homeViewModelProvider);

    return Scaffold(
      drawer: const HomeDrawer(),
      appBar: AppBar(title: const Text('Movies Dashboard')),

      body: homeStateAsync.when(
        loading: () {
          if (homeStateAsync.hasValue) {
            return _buildBody(homeStateAsync.value!, isLoadingMore: true);
          }
          return const Center(child: CircularProgressIndicator());
        },

        error: (err, stack) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Lỗi : ${err}')));
          return null;
        },

        data: (homeState) => _buildBody(homeState, isLoadingMore: false),
      ),
    );
  }

  Widget _buildBody(HomeState state, {required bool isLoadingMore}) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              MovieSection(
                title: "Phim đang chiếu",
                category: MovieCategory.nowPlaying,
              ),
              const SizedBox(height: 10),
              MovieSection(
                title: "Đánh giá cao",
                category: MovieCategory.topRated,
              ),
              const SizedBox(height: 10),
              MovieSection(
                title: "Sắp ra mắt",
                category: MovieCategory.upcoming,
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Phổ biến",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            delegate: SliverChildBuilderDelegate((context, index) {
              final movie = state.popular[index];
              return GestureDetector(
                onTap: () =>
                    context.push(RouterPath.details, extra: {'id': movie.id}),
                child: Stack(
                  children: [
                    Image.network(
                      '${AppConstants.imageUrl500}${movie.posterPath}',
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: FavoriteButton(
                        movieId: movie.id,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              );
            }, childCount: state.popular.length),
          ),
        ),

        if (isLoadingMore)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Center(child: CircularProgressIndicator()),
            ),
          ),
      ],
    );
  }
}
