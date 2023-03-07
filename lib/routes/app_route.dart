import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/pages/animation_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final AppRouter = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AnimationPage.route,
    routes: [
      GoRoute(
        path: AnimationPage.route,
        name: AnimationPage.name,
        builder: (context, state) => const AnimationPage(),
      )
    ]);
