class Type {
  final String name;
  Type({required this.name});

  factory Type.fromJson(Map<String, dynamic> json) {
    return Type(name: json["type"]["name"]);
  }
}
