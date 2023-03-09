import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

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
    return const SafeArea(
      child: Scaffold(
          body: Center(
        child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: RiveAnimation.asset("lib/assets/rive/planet.riv")),
        // Stack(
        //   alignment: Alignment.center,
        //   children: [
        //     Transform.rotate(
        //         angle: -math.pi / 4,
        //         child: AnimatedContainer(
        //           duration: const Duration(milliseconds: 200),
        //           curve: Curves.easeOutQuart,
        //           height: _sizeRocket,
        //           child: SvgPicture.asset(
        //             rocketSVG,
        //           )
        //               .animate(
        //                 onPlay: (controller) => controller.repeat(),
        //               )
        //               .shimmer(
        //                   duration: const Duration(milliseconds: 500)),
        //         )
        //         // .animate().scale(
        //         //     begin: Offset.zero,
        //         //     end: const Offset(20, 20),
        //         //     duration: const Duration(seconds: 4),
        //         //     curve: Curves.easeInOut),
        //         )
        //   ],
        // )
      )),
      // floatingActionButton: FloatingActionButton(onPressed: () {
      //   setState(() {
      //     _sizeRocket += 30;
      //   });
      // }),
    );
  }
}
