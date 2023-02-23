import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    print(dotenv.get("API_LINK"));
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: const [
            Text("asdasd"),
          ],
        ),
      ),
    );
  }
}
