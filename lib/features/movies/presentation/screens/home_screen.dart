import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/router_path.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/widgets/movie_section.dart';

import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../auth/presentation/providers/auth_provider.dart';
import '../providers/movie_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nowPlayingState = ref.watch(nowPlayingMoviesProvider);
    final popularState = ref.watch(popularMoviesProvider);
    final topRatedState = ref.watch(topRatedMoviesProvider);
    final upcomingState = ref.watch(upcomingMoviesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies Dashboard'),
        actions: [IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            ref.read(authControllerProvider.notifier).logout();
          },
        ),],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            MovieSection(
              title: "Phim đang chiếu",
              moviesValue: nowPlayingState,
            ),

            const SizedBox(height: 10),

            MovieSection(title: "Phổ biến", moviesValue: popularState),

            const SizedBox(height: 10),

            MovieSection(title: "Đánh giá cao", moviesValue: topRatedState),

            const SizedBox(height: 10),

            MovieSection(title: "Sắp ra mắt", moviesValue: upcomingState),
          ],
        ),
      ),
    );
  }
}
