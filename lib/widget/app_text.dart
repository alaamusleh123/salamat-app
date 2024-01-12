
import 'package:flutter/material.dart';


class AppText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;
  double size;

  AppText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontWeight = FontWeight.bold,
    this.size = 30,
    required this.fontFamily,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
        fontFamily: fontFamily,
      ),
    );
  }
}
