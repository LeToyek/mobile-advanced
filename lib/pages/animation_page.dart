import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimationPage extends StatefulWidget {
  static const route = "/animation";
  static const name = "animation";

  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  double _sizeRocket = 50;

  @override
  Widget build(BuildContext context) {
    const String rocketSVG = 'lib/assets/rocket.svg';
    return SafeArea(
      child: Scaffold(
        body: Center(
            child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Color.fromARGB(255, 50, 8, 112),
                      Color.fromARGB(255, 24, 122, 202)
                    ])),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Transform.rotate(
                        angle: -math.pi / 4,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeOutQuart,
                          height: _sizeRocket,
                          child: SvgPicture.asset(
                            rocketSVG,
                          )
                              .animate(
                                onPlay: (controller) => controller.repeat(),
                              )
                              .shimmer(
                                  duration: const Duration(milliseconds: 500)),
                        )
                        // .animate().scale(
                        //     begin: Offset.zero,
                        //     end: const Offset(20, 20),
                        //     duration: const Duration(seconds: 4),
                        //     curve: Curves.easeInOut),
                        )
                  ],
                ))),
        floatingActionButton: FloatingActionButton(onPressed: () {
          setState(() {
            _sizeRocket += 30;
          });
        }),
      ),
    );
  }
}
