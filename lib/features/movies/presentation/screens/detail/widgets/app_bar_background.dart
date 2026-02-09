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

        Center(
          child: IconButton(
            iconSize: 64,
            icon: const Icon(Icons.play_circle_fill, color: Colors.white),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
