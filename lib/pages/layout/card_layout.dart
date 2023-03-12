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
  late PaletteColor? _color;

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
        color: _color?.color ?? const Color.fromARGB(255, 89, 202, 255),
        borderRadius: BorderRadius.circular(12),
      ),
      child: FittedBox(
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
            ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(16)),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 0,
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromRGBO(255, 255, 255, 0.393)),
                      ),
                    ),
                    Image.network(
                      widget.imageURL,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ],
                )),
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
