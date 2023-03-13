import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/pages/home_page.dart';

class AnimationPage extends StatefulWidget {
  static const route = "/animation";
  static const name = "animation";

  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  final double _sizeRocket = 50;

  @override
  Widget build(BuildContext context) {
    const String rocketSVG = 'lib/assets/rocket.svg';
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SvgPicture.asset(rocketSVG),
          ElevatedButton(
              onPressed: () => context.push(HomePage.route),
              child: const Text("Go to Homepage"))
        ],
      )),
    );
  }
}
