import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/router_path.dart';

class NotFoundScreen extends StatelessWidget {
  final String? path;

  const NotFoundScreen({super.key, this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.error_outline_rounded,
                size: 100,
                color: Colors.grey.shade300,
              ),
              Gap(24),

              const Text(
                "404",
                style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0d253f),
                  height: 1,
                ),
              ),
              Gap(8),

              const Text(
                "Không tìm thấy trang!",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              Gap(12),

              Text(
                "Đường dẫn '${path ?? 'này'}' không tồn tại hoặc đã bị xóa.",
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),

              Gap(40),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () {
                    context.go(RouterPath.home);
                  },
                  icon: const Icon(Icons.home_rounded),
                  label: const Text(
                    "Quay về Trang chủ",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0d253f),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
