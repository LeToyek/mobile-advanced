import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            context.go(HomePage.route);
          },
          child: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/769px-Pokebola-pokeball-png-0.png",
            width: 100,
          )
              .animate(
                onPlay: (controller) => controller.repeat(),
              )
              .shimmer()
              .slideY(
                  begin: 0,
                  end: -0.5,
                  duration: const Duration(milliseconds: 500))
              .then()
              .shake(duration: const Duration(milliseconds: 1000))
              .then()
              .slideY(end: 0.5, duration: const Duration(milliseconds: 500)),
        ),
      ),
    );
  }
}
