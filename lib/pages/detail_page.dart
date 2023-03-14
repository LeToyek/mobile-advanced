import 'package:flutter/material.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final Pokemon poke;
  const DetailPage({
    Key? key,
    required this.title,
    required this.poke,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    List<String?> imagesFemale = [
      widget.poke.image.front_female,
      widget.poke.image.back_female,
      widget.poke.image.front_shiny_female,
      widget.poke.image.back_shiny_female,
    ];
    List<String?> imagesDefault = [
      widget.poke.image.front_default,
      widget.poke.image.back_default,
      widget.poke.image.front_shiny,
      widget.poke.image.back_shiny,
    ];
    return BaseLayout(
        title: widget.title,
        contentWidget: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                widget.poke.name,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 100,
                child: PageView.builder(
                  controller: PageController(),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    if (widget.poke.image.front_default == null) {
                      return Hero(
                          tag: "hero${widget.title}",
                          child: Image.network(imagesFemale[index]!));
                    }
                    return Hero(
                        tag: "hero${widget.title}",
                        child: Image.network(imagesDefault[index]!));
                  },
                ),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: widget.poke.stats.length,
                itemBuilder: (context, index) {
                  var stat = widget.poke.stats[index];
                  return Container(
                    child: Column(
                      children: [
                        Text(stat.name),
                        Text(stat.baseStat.toString()),
                        Text(stat.effort.toString()),
                      ],
                    ),
                  );
                },
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.poke.types.length,
                itemBuilder: (context, index) =>
                    Text(widget.poke.types[index].name),
              )
            ],
          ),
        ));
  }
}
