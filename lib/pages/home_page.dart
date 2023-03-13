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
      contentWidget: CustomScrollView(slivers: [
        BlocBuilder(
          bloc: locator<PokemonCubit>()..getPokemons(),
          builder: (context, state) {
            if (state is PokemonInitial) {
              return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is PokemonData) {
              return SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var pokemons = state.pokes;
                    if (pokemons.isEmpty) {
                      return const Text("Empty Pokemon");
                    }
                    return InkWell(
                        onTap: () => context.pushNamed("Detail",
                            params: {"id": pokemons[index].name},
                            extra: pokemons[index]),
                        child: CardLayout(
                            imageURL: pokemons[index].image,
                            name: pokemons[index].name));
                  }, childCount: state.pokes.length),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 12),
                ),
              );
            } else if (state is PokemonError) {
              return SliverToBoxAdapter(child: Text(state.message));
            }
            return SliverToBoxAdapter(child: Container());
          },
        ),
      ]),
    ));
  }
}
