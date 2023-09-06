import 'package:flutter/material.dart';

class ColorPalette {
  const ColorPalette();
  Color get mainBackgroundColor => const Color.fromARGB(255, 51, 51, 61);
  Color get navigationBarColor => const Color.fromARGB(255, 65, 65, 78);
  Color get headerBackgroundColor => const Color.fromARGB(255, 45, 45, 61);
  Color get grey => const Color.fromARGB(255, 37, 37, 37);
  Color get font => Colors.white;
  Color get dividingLine => const Color.fromARGB(255, 78, 78, 78);
  Color get subFont => const Color.fromARGB(255, 172, 172, 172);
  Color get sendButton => const Color.fromARGB(255, 255, 255, 255);
  Color get card => const Color.fromARGB(237, 255, 255, 255);
  Color get boxFillColor => const Color.fromARGB(255, 62, 62, 75);
  Color get transparent => const Color.fromARGB(0, 255, 255, 255);
  Color get dialogFill => const Color.fromARGB(255, 66, 73, 92);
  Color get inputLabel => const Color.fromARGB(255, 206, 206, 215);
  Color get inputFill => navigationBarColor;
}