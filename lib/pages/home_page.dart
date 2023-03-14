import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';
import 'package:mobile_advanced/pages/layout/card_layout.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

class HomePage extends StatefulWidget {
  final String title;
  static const route = "/home";
  static const name = "home";

  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late double moveTarget = 0;
  String? moveTarget;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BaseLayout(
      title: widget.title,
      contentWidget:
          CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            if (state is PokemonInitial) {
              return const SliverFillRemaining(
                  hasScrollBody: false,
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is PokemonData) {
              return SliverPadding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 80),
                sliver: SliverGrid(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    var pokemons = state.pokes;
                    if (pokemons.isEmpty) {
                      return const Text("Empty Pokemon");
                    }
                    var poke = pokemons[index];
                    return InkWell(
                        onTap: () {
                          Future.delayed(const Duration(milliseconds: 400))
                              .then((value) {
                            context.pushNamed("Detail",
                                params: {"id": poke.name}, extra: poke);
                            setState(() {
                              moveTarget = null;
                            });
                          });
                          setState(() {
                            moveTarget = poke.name;
                          });
                        },
                        child: CardLayout(
                                imageURL: poke.image.front_default ??
                                    poke.image.front_female!,
                                name: poke.name)
                            .animate(
                              key: ValueKey(poke.name),
                              target: poke.name == moveTarget ? 1 : 0,
                              // onPlay: (controller) => controller.loop(count: 2),
                            )
                            .shimmer(
                                duration: const Duration(milliseconds: 200)));
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
