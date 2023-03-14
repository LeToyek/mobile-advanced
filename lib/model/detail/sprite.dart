class Sprite {
  String? back_default,
      back_female,
      back_shiny,
      back_shiny_female,
      front_default,
      front_female,
      front_shiny,
      front_shiny_female;

  Sprite(
      {this.back_default,
      this.back_female,
      this.back_shiny,
      this.back_shiny_female,
      this.front_default,
      this.front_female,
      this.front_shiny,
      this.front_shiny_female});

  factory Sprite.fromJson(Map<String, dynamic> json) {
    return Sprite(
        back_default: json["back_default"],
        back_female: json["back_female"],
        back_shiny: json["back_shiny"],
        back_shiny_female: json["back_shiny_female"],
        front_default: json["front_default"],
        front_female: json["front_female"],
        front_shiny: json["front_shiny"],
        front_shiny_female: json["front_shiny_female"]);
  }
}
