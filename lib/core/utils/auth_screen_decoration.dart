import 'package:flutter/material.dart';

class AuthScreenDecoration {
  static BoxDecoration get defaultBackground => BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        const Color.fromARGB(255, 74, 77, 82),
        Colors.black87
      ]
    ),
  );
}