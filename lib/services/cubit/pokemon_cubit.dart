import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
}
