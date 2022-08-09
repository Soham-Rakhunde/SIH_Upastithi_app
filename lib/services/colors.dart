import 'package:flutter/material.dart';

const bgColor = Colors.white;
const redGradient = [
  Color.fromRGBO(254, 154, 92, 1),
  Color.fromRGBO(255, 93, 91, 1),
];
const shadowColor = Colors.black38;
const textColor = Colors.black54;

List<BoxShadow> boxShadow = [
  const BoxShadow(color: shadowColor, offset: Offset(0, 1), blurRadius: 9),
];

class Palette {
  static const Color darkBlue = Color(0xff092E34);
  static const Color lightBlue = Color(0xff489FB5);
  static const Color orange = Color(0xffFFA62B);
  static const Color darkOrange = Color(0xffCC7700);
}
