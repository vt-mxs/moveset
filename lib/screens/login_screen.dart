import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/utils/auth_screen_decoration.dart';
import 'package:moveset/core/widgets/responsive_button.dart';
import 'package:moveset/core/widgets/custom_input_field.dart';
import 'package:moveset/core/widgets/responsive_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
  
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: AuthScreenDecoration.defaultBackground,
            
            child: Padding(
              padding: const EdgeInsets.only(top: 100, left: 22),
              child: ResponsiveText(
                text: 'Olá\nBem vindo de volta!',
                fontSize: 6,
                align: TextAlign.left,
                style: TextStyle(
                  color: AppColors.mainIceWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.mainIceWhite,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),

              width: double.infinity,
              height: screenHeight * 0.7,
              //constraints: BoxConstraints(minHeight: screenHeight * 0.6),

              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomInputField(label: 'Email'),
                
                      SizedBox(height: screenHeight * 0.06),
                
                      CustomInputField(label: 'Senha'),
                
                      SizedBox(height: screenHeight * 0.08),
                
                      Center(
                        child: ResponsiveButton(
                          text: 'LOGAR',
                          onPressed: () =>{},
                
                          textStyle: TextStyle(
                            color: AppColors.mainIceWhite,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                          ),
                          color: AppColors.mainShowCaseBlue,
                          shadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(90),
                              spreadRadius: 2,
                              blurRadius: 6,
                              offset: Offset(0, 3)
                            )
                          ],
                        ),
                      ),
                      
                      SizedBox(height: screenHeight * 0.05),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => {print('oi')},
                          child: ResponsiveText(
                            text: 'Esqueceu sua senha?',
                            fontSize: 5,
                            style: TextStyle(
                              color: AppColors.mainGray,
                              decoration: TextDecoration.underline
                            )
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}