import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/repository/i_poke_repository.dart';

@lazySingleton
class DevPokemonService implements IPokeRepository {
  final Dio dio;

  DevPokemonService(this.dio);

  @override
  Future<List<Pokemon>> getPokemon() async {
    throw UnimplementedError();
  }
}
