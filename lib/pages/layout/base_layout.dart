import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BaseLayout extends StatelessWidget {
  final String title;
  final Widget contentWidget;
  const BaseLayout({
    Key? key,
    required this.title,
    required this.contentWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(title),
      ),
      body: contentWidget,
    );
  }
}
