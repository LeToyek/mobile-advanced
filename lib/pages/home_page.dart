import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [],
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: [
            const Text("asdasd"),
            BlocBuilder<PokemonCubit, PokemonState>(builder: (context, state) {
              if (state is PokemonInitial) {
                return const CircularProgressIndicator();
              } else if (state is PokemonData) {
                return const Text("ok");
              } else if (state is PokemonError) {
                return Text(state.message);
              }
              return Container();
            })
          ],
        ),
      ),
    );
  }
}
