import 'package:flutter/material.dart';

class MyConstant {
  //field
  static Color primary = Color.fromARGB(255, 120, 11, 175);
  static Color dark = const Color.fromARGB(255, 38, 46, 2);
  static Color ligh = Color.fromARGB(255, 163, 81, 214);
  static Color active = Color.fromARGB(255, 19, 133, 195);

  //method

  BoxDecoration bgBox() {
    return BoxDecoration(
      gradient: RadialGradient(
        radius: 0.75,
        center: const Alignment(-0.35, -0.3),
        colors: <Color>[Colors.white, primary],
      ),
    );
  }

  TextStyle h1Style() {
    return TextStyle(
      fontSize: 36,
      color: dark,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle h2Style() {
    return TextStyle(
      fontSize: 18,
      color: dark,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle h3Style() {
    return TextStyle(
      fontSize: 14,
      color: dark,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3lightStyle() {
    return TextStyle(
      fontSize: 14,
      color: ligh,
      fontWeight: FontWeight.normal,
    );
  }

  TextStyle h3ActiveStyle() {
    return TextStyle(
      fontSize: 16,
      color: active,
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle h3WhiteActiveStyle() {
    return const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.w500,
    );
  }
}   // end Class