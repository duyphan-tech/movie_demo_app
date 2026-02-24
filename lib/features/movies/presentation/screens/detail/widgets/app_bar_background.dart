import 'package:flutter/material.dart';
import 'package:movie_demo_app/core/utils/widgets/custom_network_image.dart';

class AppBarBackground extends StatelessWidget {
  final String imageUrl;

  const AppBarBackground({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        CustomNetworkImage(
          imageUrl: imageUrl,
          fit: BoxFit.cover,
          borderRadius: 0,
        ),

        const DecoratedBox(decoration: BoxDecoration(color: Colors.black38)),

        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withAlpha(128), Colors.transparent],
              ),
            ),
          ),
        ),

        // Center(
        //   child: IconButton(
        //     iconSize: 64,
        //     icon: const Icon(Icons.play_circle_fill, color: Colors.white),
        //     onPressed: () {},
        //   ),
        // ),
      ],
    );
  }
}
