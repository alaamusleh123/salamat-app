import 'package:flutter/material.dart';
class Indicator extends StatelessWidget {
  final double marginEnd;//2
  final bool selected;
  const Indicator({Key? key,  this.marginEnd=0, required this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsDirectional.only(end: marginEnd),
      width: 40,
      height:14,
      decoration: BoxDecoration(
        borderRadius:selected ? BorderRadius.circular(50) : BorderRadius.circular(700) ,
        gradient:selected ? LinearGradient(
            colors: [
              Color(0xFF5CBA97),
              Color(0xFF368EC8),
            ]) : LinearGradient(
            colors: [
              Colors.grey,
              Colors.grey
            ]),
      ),
    )  ;
  }
}
