import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/constants/app_routes.dart';
import 'package:moveset/core/constants/assets_paths.dart';
import 'package:moveset/core/widgets/responsive_button.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,

        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              const Color.fromARGB(255, 74, 77, 82),
              Colors.black87
            ]
          ),
        ),
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AssetsPaths.welcomeImage,
              width: 270,
              height: 270
            ),
            
            const SizedBox(height: 30),

            Text(
              'Um homem sem disciplina se torna somente mais um',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.mainIceWhite
              )
            ),
            
            const SizedBox(height: 43),

            ResponsiveButton(
              text: 'LOGIN',
              textStyle: TextStyle(
                color: AppColors.mainIceWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              onPressed: () => Navigator.of(context).pushNamed(AppRoutes.login),
              border: Border.all(color: AppColors.mainShowCaseBlue),
            ),
            
            const SizedBox(height: 30),

            ResponsiveButton(
              text: 'REGISTRAR-SE',
              textStyle: TextStyle(
                color: AppColors.mainIceWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
              color: AppColors.mainShowCaseBlue,
            ),
          ]
        ),

      ),
    );
  }
}