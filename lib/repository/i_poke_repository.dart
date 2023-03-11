import 'package:mobile_advanced/model/pokemon.dart';

abstract class IPokeRepository {
  Future<List<Pokemon>> getPokemon();
}
