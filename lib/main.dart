import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/screens/welcome_screen.dart';

void main() {
  runApp(MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen()
    );
  }
}