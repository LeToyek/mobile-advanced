import 'package:mobile_advanced/model/detail/ability.dart';
import 'package:mobile_advanced/model/detail/sprite.dart';
import 'package:mobile_advanced/model/detail/stat.dart';
import 'package:mobile_advanced/model/detail/type.dart';

class Pokemon {
  final Sprite image;
  final String name;
  final List<Stat> stats;
  final List<Ability> abilities;
  final int height, weight;
  final List<Type> types;

  Pokemon({
    required this.image,
    required this.name,
    required this.stats,
    required this.abilities,
    required this.height,
    required this.weight,
    required this.types,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        image: Sprite.fromJson(json["sprites"]),
        name: json["name"],
        stats: (json["stats"] as List<dynamic>)
            .map((e) => Stat.fromJson(e))
            .toList(),
        abilities: (json["abilities"] as List<dynamic>)
            .map((e) => Ability.fromJson(e))
            .toList(),
        height: json["height"],
        weight: json["weight"],
        types: (json["types"] as List<dynamic>)
            .map((e) => Type.fromJson(e))
            .toList());
  }
}
