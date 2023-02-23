import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_advanced/model/pokemon.dart';

class PokemonService {
  Future<List<Pokemon>> getPokemon() async {
    try {
      if (dotenv.get("DEBUG_MODE") == "DEBUG") {
        var res = await Dio().get(dotenv.get("API_LINK"));
      }
      return [];
    } catch (e) {}
    return [];
  }
}
