import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/constants/color.dart';

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
        backgroundColor: bgColor2,
        actions: const [],
        leading: IconButton(
            onPressed: () => context.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(title),
      ),
      body: contentWidget,
      bottomNavigationBar: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bgColor2,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.home_filled)),
            IconButton(
                onPressed: () {},
                color: Colors.white,
                icon: const Icon(Icons.settings)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {},
          heroTag: null,
          child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50), color: Colors.white),
            child: Hero(
              tag: "PokeTag",
              child: Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/769px-Pokebola-pokeball-png-0.png",
              ),
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
