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
