import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced/config/injectable.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

class HomePage extends StatelessWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: const [],
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<PokemonCubit, PokemonState>(
                bloc: locator<PokemonCubit>()..getPokemons(),
                builder: (context, state) {
                  if (state is PokemonInitial) {
                    return const CircularProgressIndicator();
                  } else if (state is PokemonData) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: state.pokes.length,
                      itemBuilder: (context, index) {
                        var pokemons = state.pokes;
                        if (pokemons.isEmpty) {
                          return const Text("Empty Pokemon");
                        }
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 4, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32)),
                          child: Row(
                            children: [
                              Image.network(pokemons[index].image),
                              Text(pokemons[index].name),
                            ],
                          ),
                        );
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
      ),
    );
  }
}
