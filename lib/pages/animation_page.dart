import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimationPage extends StatelessWidget {
  static const route = "/animation";
  static const name = "animation";

  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
                child: const Text(
          "data",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
        )
                    .animate(
                      onPlay: (controller) => controller.repeat(),
                    )
                    .color(
                      begin: Colors.blue,
                      end: Colors.purple,
                    )
                    .shake(duration: const Duration(seconds: 3))
                    .shimmer()
                    .slideY(begin: 2, end: -2, curve: Curves.ease))),
      ),
    );
  }
}
