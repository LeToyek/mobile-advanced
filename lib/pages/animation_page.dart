import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  static const route = "/animation";
  static const name = "animation";

  const AnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("data"),
      ),
    );
  }
}
