class Ability {
  String name;

  Ability({required this.name});

  factory Ability.fromJson(Map<String, dynamic> json) {
    return Ability(name: json["name"]);
  }
}
