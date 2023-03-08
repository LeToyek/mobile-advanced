import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_advanced/config/injectable.dart';
import 'package:mobile_advanced/routes/app_route.dart';

void main() async {
  await dotenv.load(fileName: "../lib/.env");
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the roxot of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: locator<AppRouter>().router,
    );
  }
}
