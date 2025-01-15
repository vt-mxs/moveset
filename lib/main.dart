import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_routes.dart';
import 'package:moveset/screens/login_screen.dart';
import 'package:moveset/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.welcome,

      routes: {
        AppRoutes.welcome: (_) => const WelcomeScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        //'/register': (_) => TODO:implementar tela de registro depois
      },
    );
  }
}