import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/services/api/poke_api.dart';

part 'pokemon_state.dart';

@injectable
class PokemonCubit extends Cubit<PokemonState> {
  final PokemonService service;
  PokemonCubit(
    this.service,
  ) : super(PokemonInitial());

  Future<void> getPokemons() async {
    var pokemons = await service.getPokemon();
    if (pokemons.isNotEmpty) {
      emit(PokemonData(pokes: pokemons));
    } else {
      emit(PokemonError(message: "Error getting pokemon"));
    }
  }
}
