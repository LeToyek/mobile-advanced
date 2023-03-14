// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class CardLayout extends StatefulWidget {
  final String imageURL;
  final String name;
  const CardLayout({
    Key? key,
    required this.imageURL,
    required this.name,
  }) : super(key: key);

  @override
  State<CardLayout> createState() => _CardLayoutState();
}

class _CardLayoutState extends State<CardLayout> {
  PaletteColor? _color;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _color = null;
    _updatePalette();
  }

  Future<void> _updatePalette() async {
    final PaletteGenerator generator =
        await PaletteGenerator.fromImageProvider(NetworkImage(widget.imageURL));
    setState(() {
      _color = generator.mutedColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mTextTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: _color?.color ?? const Color.fromARGB(255, 65, 152, 193),
        borderRadius: BorderRadius.circular(12),
      ),
      child: FittedBox(
        fit: BoxFit.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.name,
              style: TextStyle(
                  fontSize: mTextTheme.titleMedium!.fontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 16,
            ),
            Stack(
              children: [
                Positioned.fill(
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(255, 255, 255, 0.393)),
                    ),
                  ),
                ),
                Positioned(
                  child: Hero(
                    tag: "hero${widget.name}",
                    child: Image.network(
                      widget.imageURL,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
