import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_demo_app/core/router/app_router.dart';

import 'core/configs/app_config.dart';

class MyApp extends ConsumerWidget {
  final AppConfig config;

  const MyApp({super.key, required this.config});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter routerConfig = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
          brightness: Brightness.light,
        ),

        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          filled: true,
          fillColor: Colors.grey.shade50,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 14,
          ),
        ),

        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

      routerConfig: routerConfig,
    );
  }
}

// class HomePage extends StatelessWidget {
//   final AppConfig config;
//
//   const HomePage({super.key, required this.config});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(config.appName),
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text(
//                   'Current Environment:',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 10),
//
//                 // Hiển thị Flavor hiện tại
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                   decoration: BoxDecoration(
//                     color: config.flavor == Flavor.dev
//                         ? Colors.red.withOpacity(0.1)
//                         : Colors.blue.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(8),
//                     border: Border.all(
//                         color: config.flavor == Flavor.dev ? Colors.red : Colors.blue
//                     ),
//                   ),
//                   child: Text(
//                     config.flavor.toString().split('.').last.toUpperCase(),
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.w900,
//                       color: config.flavor == Flavor.dev ? Colors.red : Colors.blue,
//                     ),
//                   ),
//                 ),
//
//                 const SizedBox(height: 20),
//                 const Text('API Base URL:'),
//               ],
//             ),
//           ),
//
//           // Thêm một Banner nhỏ ở góc màn hình nếu là môi trường DEV
//           if (config.flavor == Flavor.dev)
//             Banner(
//               message: "DEV",
//               location: BannerLocation.topStart,
//               color: Colors.red,
//             ),
//         ],
//       ),
//     );
//   }
// }
