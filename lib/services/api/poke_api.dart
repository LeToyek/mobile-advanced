import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/repository/i_poke_repository.dart';

@lazySingleton
class PokemonService implements IPokeRepository {
  final Dio dio;
  PokemonService({
    required this.dio,
  });

  @override
  Future<List<Pokemon>> getPokemon() async {
    int limitPoke = 10;
    try {
      var res = await dio.get("?offset=0&limit=$limitPoke");
      List<Pokemon> pokemons = [];
      for (var data in res.data["results"]) {
        var detailRes = await dio.get(data["url"]);
        pokemons.add(Pokemon.fromJson(detailRes.data));
      }
      getOnePokemon("ditto");
      return pokemons;
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
  }

  Future<Pokemon> getOnePokemon(String name) async {
    try {
      var res = await dio.get("/$name");
      print(res);
      return Pokemon(image: "image", name: name, stats: <Stat>[]);
    } on DioError {
      throw const FormatException();
    }
  }
}
