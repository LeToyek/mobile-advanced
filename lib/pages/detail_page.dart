import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_advanced/config/injectable.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';
import 'package:mobile_advanced/services/cubit/pokemon_cubit.dart';

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: title,
        contentWidget: Container(
          child: BlocBuilder(
            bloc: locator<PokemonCubit>()..getOnePokemon(title.toLowerCase()),
            builder: (context, state) {
              if (state is PokemonInitial) {
                return const CircularProgressIndicator();
              }
              if (state is PokemonOneData) {
                return Column(
                  children: [
                    Text(state.poke.name),
                    Image.network(state.poke.image),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.poke.stats.length,
                      itemBuilder: (context, index) {
                        var stat = state.poke.stats[index];
                        return Container(
                          child: Column(
                            children: [
                              Text(stat.name),
                              Text(stat.baseStat.toString()),
                              Text(stat.effort.toString()),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              }
              if (state is PokemonError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        ));
  }
}
