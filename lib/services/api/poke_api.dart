import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_advanced/model/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> getPokemon() async {
    try {
      if (dotenv.get("DEBUG_MODE") == "DEBUG") {
        var res = await Dio().get(dotenv.get("BASE_API"));
        print(res.data["results"]);
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }
}
