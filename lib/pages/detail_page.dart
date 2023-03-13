import 'package:flutter/material.dart';
import 'package:mobile_advanced/model/pokemon.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final Pokemon poke;
  const DetailPage({
    Key? key,
    required this.title,
    required this.poke,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: title,
        contentWidget: Column(
          children: [
            Text(
              poke.name,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
            Image.network(poke.image),
            ListView.builder(
              shrinkWrap: true,
              itemCount: poke.stats.length,
              itemBuilder: (context, index) {
                var stat = poke.stats[index];
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
            )
          ],
        ));
  }
}
