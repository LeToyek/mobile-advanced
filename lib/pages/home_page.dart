import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced/config/injectable.dart';
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
            BlocBuilder<PokemonCubit, PokemonState>(
              bloc: locator<PokemonCubit>()..getPokemons(),
              builder: (context, state) {
                if (state is PokemonInitial) {
                  return const CircularProgressIndicator();
                } else if (state is PokemonData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.pokes.length,
                    itemBuilder: (context, index) {
                      return Text(state.pokes[index].name);
                    },
                  );
                } else if (state is PokemonError) {
                  return Text(state.message);
                }
                return Container();
              },
            )
          ],
        ),
      ),
    );
  }
}
