import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_advanced/model/pokemon.dart';

@lazySingleton
class PokemonService {
  final Dio dio;
  PokemonService({
    required this.dio,
  });

  Future<List<Pokemon>> getPokemon() async {
    int limitPoke = 10;
    try {
      if (dotenv.get("DEBUG_MODE") == "DEBUG") {
        var res = await dio.get("?offset=0&limit=$limitPoke");
        List<Pokemon> pokemons = [];
        for (var data in res.data["results"]) {
          var detailRes = await Dio().get(data["url"]);
          pokemons.add(Pokemon.fromJson(detailRes.data));
        }
        return pokemons;
      }
      return [];
    } on DioError catch (e) {
      if (e.type == DioErrorType.unknown) {
        throw const FormatException(
          "Endpoint not found",
        );
      } else if (e.type == DioErrorType.connectionError) {
        throw const FormatException(
          "You have no internet connection",
        );
      } else {
        throw FormatException(
          e.message.toString(),
        );
      }
    }
    return [];
  }
}
