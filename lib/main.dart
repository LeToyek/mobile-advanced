import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_advanced/config/injectable.dart';
import 'package:mobile_advanced/routes/app_route.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  configureDependencies("prod");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the roxot of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => locator<PokemonCubit>()..getPokemons(),
        child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blueGrey,
          ),
          routerConfig: locator<AppRouter>().router,
        ));
  }
}
