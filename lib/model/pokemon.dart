class Pokemon {
  final String image, name;
  final List<Stat> stats;

  Pokemon({required this.image, required this.name, required this.stats});

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
        image: json["sprites"]["front_default"],
        name: json["name"],
        stats: (json["stats"] as List<dynamic>)
            .map((e) => Stat.fromJson(e))
            .toList());
  }
}

class Stat {
  final int baseStat, effort;
  final String name;

  Stat({required this.baseStat, required this.effort, required this.name});

  factory Stat.fromJson(Map<String, dynamic> json) {
    return Stat(
        baseStat: json["base_stat"],
        effort: json["effort"],
        name: json["stat"]["name"]);
  }
}
