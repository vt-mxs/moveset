import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/widgets/responsive_button.dart';
import 'package:moveset/core/widgets/responsive_text.dart';

class AuthScreen extends StatelessWidget {
  final String title;
  final List<Widget> inputs;
  final String buttonText;
  final VoidCallback onSubmit;
  final List<Widget> footerWidgets;

  const AuthScreen({
    super.key,
    required
    this.title,
    required this.inputs,
    required this.buttonText,
    required this.onSubmit,
    this.footerWidgets = const [],
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
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    bottom: MediaQuery.of(context).viewInsets.bottom
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...inputs,

                      SizedBox(height: screenHeight * 0.06),
                      
                      Center(
                        child: ResponsiveButton(
                          text: buttonText,
                          onPressed: onSubmit,
                
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

                      ...footerWidgets,
                      
                      Padding(
                        padding: EdgeInsets.only(top: screenHeight * 0.07),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, size: 60, color: AppColors.mainShowCaseBlue),
                          onPressed: () => Navigator.pop(context)
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