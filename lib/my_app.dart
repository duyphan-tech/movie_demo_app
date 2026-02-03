import 'package:flutter/material.dart';

import 'app_config.dart';

class MyApp extends StatelessWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Tên ứng dụng lấy từ Config
      title: config.appName,

      // Tắt banner debug mặc định của Flutter
      debugShowCheckedModeBanner: false,

      // Cấu hình Theme tùy theo Flavor để dễ phân biệt bằng mắt thường
      theme: ThemeData(
        useMaterial3: true,
        // Nếu là DEV thì màu đỏ, PROD thì màu xanh
        colorSchemeSeed: config.flavor == Flavor.dev ? Colors.red : Colors.blue,
      ),

      home: HomePage(config: config),
    );
  }
}

class HomePage extends StatelessWidget {
  final AppConfig config;

  const HomePage({super.key, required this.config});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(config.appName),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Current Environment:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                // Hiển thị Flavor hiện tại
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: config.flavor == Flavor.dev
                        ? Colors.red.withOpacity(0.1)
                        : Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                        color: config.flavor == Flavor.dev ? Colors.red : Colors.blue
                    ),
                  ),
                  child: Text(
                    config.flavor.toString().split('.').last.toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      color: config.flavor == Flavor.dev ? Colors.red : Colors.blue,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
                const Text('API Base URL:'),
                Text(
                  config.apiBaseUrl,
                  style: const TextStyle(fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),

          // Thêm một Banner nhỏ ở góc màn hình nếu là môi trường DEV
          if (config.flavor == Flavor.dev)
            Banner(
              message: "DEV",
              location: BannerLocation.topStart,
              color: Colors.red,
            ),
        ],
      ),
    );
  }
}