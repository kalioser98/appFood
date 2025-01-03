import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color.fromRGBO(10, 85, 80, 1);
  static const Color primarySecondary = Color.fromRGBO(154, 194, 174, 1);
  static const Color lightGrey = Color.fromRGBO(245, 245, 245, 1);
  static const Color grey = Color.fromRGBO(151, 150, 161, 1);
  static const Color secondary = Color.fromARGB(255, 255, 255, 255);
  static LinearGradient bottomShadow = LinearGradient(colors: [
    const Color(0xFF107873).withOpacity(0.2),
    const Color(0xFF107873).withOpacity(0)
  ], begin: Alignment.bottomCenter, end: Alignment.topCenter);
  static LinearGradient linearBlackBottom = LinearGradient(
      colors: [Colors.black.withOpacity(0.45), Colors.black.withOpacity(0)],
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter);
  static LinearGradient linearBlackTop = LinearGradient(
      colors: [Colors.black.withOpacity(0.5), Colors.transparent],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);
  static const Color favRed = Color.fromRGBO(198, 67, 67, 1);
}
