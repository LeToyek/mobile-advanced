import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_advanced/model/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> getPokemon() async {
    int limitPoke = 10;
    try {
      if (dotenv.get("DEBUG_MODE") == "DEBUG") {
        var res = await Dio()
            .get("${dotenv.get("BASE_API")}?offset=0&limit=$limitPoke");
        List<Pokemon> pokemons = [];
        for (var data in res.data["results"]) {
          var detailRes = await Dio().get(data["url"]);
          pokemons.add(Pokemon.fromJson(detailRes.data));
        }
        return pokemons;
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }
}
