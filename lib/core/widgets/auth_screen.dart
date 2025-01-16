import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/utils/auth_screen_decoration.dart';
import 'package:moveset/core/widgets/responsive_button.dart';
import 'package:moveset/core/widgets/responsive_text.dart';

class AuthScreen extends StatelessWidget {
  final String title;
  final List<Widget> inputs;
  final List<Widget> footerWidgets;
  final String buttonText;
  final VoidCallback onSubmit;

  const AuthScreen({
    super.key,
    required
    this.title,
    required this.inputs,
    this.footerWidgets = const [],
    required this.buttonText,
    required this.onSubmit
  });

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
                text: title,
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
              height: screenHeight * 0.69,

              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.05
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...inputs,

                      SizedBox(height: screenHeight * 0.08),
                      
                      Center(
                        child: ResponsiveButton(
                          text: buttonText,
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

                      ...footerWidgets
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