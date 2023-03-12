import 'package:flutter/material.dart';

class CardLayout extends StatelessWidget {
  final String imageURL;
  final String name;
  const CardLayout({
    Key? key,
    required this.imageURL,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1)),
      child: Column(
        children: [
          Image.network(imageURL),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }
}
