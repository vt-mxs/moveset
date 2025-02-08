import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moveset/core/constants/app_routes.dart';
import 'package:moveset/firebase_options.dart';
import 'package:moveset/view/auth/login_screen.dart';
import 'package:moveset/view/auth/register_screen.dart';
import 'package:moveset/view/auth/welcome_screen.dart';
import 'package:moveset/view/home/home_screen.dart';
import 'package:moveset/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: true);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]).then((_) => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel())
      ],
      child: const MyApp(),
    )
  ));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: FirebaseAuth.instance.currentUser != null ? AppRoutes.home : AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (_) => const WelcomeScreen(),
        AppRoutes.login: (_) => LoginScreen(),
        AppRoutes.register: (_) => RegisterScreen(),
        AppRoutes.home : (_) => const HomeScreen()
      },
    );
  }
}