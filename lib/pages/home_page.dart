import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/config/injectable.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';
import 'package:mobile_advanced/pages/layout/card_layout.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

class HomePage extends StatelessWidget {
  final String title;
  static const route = "/home";
  static const name = "home";

  const HomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BaseLayout(
      title: title,
      contentWidget: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder(
                bloc: locator<PokemonCubit>()..getPokemons(),
                builder: (context, state) {
                  if (state is PokemonInitial) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is PokemonData) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 12),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.pokes.length,
                        itemBuilder: (context, index) {
                          var pokemons = state.pokes;
                          if (pokemons.isEmpty) {
                            return const Text("Empty Pokemon");
                          }
                          return InkWell(
                              onTap: () => context.goNamed(
                                    "Detail",
                                    params: {"id": pokemons[index].name},
                                  ),
                              child: CardLayout(
                                  imageURL: pokemons[index].image,
                                  name: pokemons[index].name));
                        },
                      ),
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
    ));
  }
}
