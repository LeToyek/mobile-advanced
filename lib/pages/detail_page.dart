import 'package:flutter/material.dart';
import 'package:mobile_advanced/pages/layout/base_layout.dart';

class DetailPage extends StatelessWidget {
  final String title;
  const DetailPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        title: title,
        contentWidget: Container(
          child: Text(title),
        ));
  }
}
