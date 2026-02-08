import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_demo_app/features/auth/presentation/providers/auth_provider.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/favorite_movies_screen.dart';
import 'package:movie_demo_app/features/movies/presentation/screens/rated_movies_screen_screen.dart';

class HomeDrawer extends ConsumerWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF0d253f)),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Text(
                "D",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0d253f),
                ),
              ),
            ),
            accountName: const Text(
              "Duy Phan",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("duyphan@example.com"),
          ),

          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Trang chủ'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.favorite, color: Colors.red),
                  title: const Text('Phim yêu thích'),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavoriteMoviesScreen(),
                      ),
                    );
                  },
                ),

                ListTile(
                  leading: const Icon(Icons.star, color: Colors.amber),
                  title: const Text('Phim đã đánh giá'),
                  onTap: () {
                    Navigator.pop(context);
                    // Navigate sang màn hình Rated
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RatedMoviesScreen(),
                      ), // Màn hình bạn tạo ở bài trước
                    );
                  },
                ),

                const Divider(),

                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Cài đặt'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          ListTile(
            leading: const Icon(Icons.logout, color: Colors.grey),
            title: const Text('Đăng xuất'),
            onTap: () {
              showDialog(
                context: context,
                builder: (dialogContext) => AlertDialog(
                  title: const Text('Đăng xuất'),
                  content: const Text('Bạn có chắc chắn muốn đăng xuất không?'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(dialogContext).pop(),
                      child: const Text('Hủy'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(dialogContext).pop();
                        ref.read(authControllerProvider.notifier).logout();
                      },
                      child: const Text(
                        'Đồng ý',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
