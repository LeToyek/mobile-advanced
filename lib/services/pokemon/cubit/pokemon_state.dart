part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class PokemonData extends PokemonState {
  final List<Pokemon> pokes;
  PokemonData({
    required this.pokes,
  });
}

class PokemonOneData extends PokemonState {
  final Pokemon poke;

  PokemonOneData({required this.poke});
}

class PokemonError extends PokemonState {
  final String message;
  PokemonError({
    required this.message,
  });
}
