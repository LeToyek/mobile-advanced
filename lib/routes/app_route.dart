import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_advanced/pages/animation_page.dart';
import 'package:mobile_advanced/pages/home_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

@lazySingleton
class AppRouter {
  final router = GoRouter(
      navigatorKey: _rootNavigatorKey,
      initialLocation: AnimationPage.route,
      routes: [
        GoRoute(
          path: AnimationPage.route,
          name: AnimationPage.name,
          builder: (context, state) => const AnimationPage(),
        ),
        GoRoute(
          path: HomePage.route,
          name: HomePage.name,
          builder: (context, state) => const HomePage(title: "home"),
        )
      ]);
}
