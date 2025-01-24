import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:moveset/core/constants/app_routes.dart';
import 'package:moveset/firebase_options.dart';
import 'package:moveset/view/auth/login_screen.dart';
import 'package:moveset/view/auth/register_screen.dart';
import 'package:moveset/view/auth/welcome_screen.dart';
import 'package:moveset/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, DeviceOrientation.portraitDown
  ]).then((_) => runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewmodel())
      ],
      child: MyApp(),
    )
  ));
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: AppRoutes.welcome,
      routes: {
        AppRoutes.welcome: (_) => const WelcomeScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.register: (_) => RegisterScreen()
      },
    );
  }
}
