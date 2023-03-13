import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/repository/i_poke_repository.dart';

part 'pokemon_state.dart';

@injectable
class PokemonCubit extends Cubit<PokemonState> {
  final IPokeRepository service;
  PokemonCubit(
    this.service,
  ) : super(PokemonInitial());

  Future<void> getPokemons() async {
    var pokemons = await service.getPokemon();
    try {
      emit(PokemonData(pokes: pokemons));
    } on FormatException catch (e) {
      PokemonError(message: e.message);
    }
  }
}
