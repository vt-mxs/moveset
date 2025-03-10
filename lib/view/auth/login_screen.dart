import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_routes.dart';
import 'package:moveset/core/widgets/auth_screen.dart';
import 'package:moveset/core/widgets/custom_input_field.dart';
import 'package:moveset/core/widgets/responsive_text.dart';
import 'package:moveset/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final AuthViewmodel authViewmodel = Provider.of<AuthViewmodel>(context);
    
    return AuthScreen(
      title: 'Olá\nQue bom te ver de novo!',
      inputs: [
        CustomInputField(
          label: 'Email',
          controller: _emailController,
        ),
                
        SizedBox(height: screenHeight * 0.03),
  
        CustomInputField(
          label: 'Senha',
          isPassword: true,
          controller: _passwordController,
        ),
      ],

      buttonText: authViewmodel.isLoading ? 'CARREGANDO...' : 'LOGIN',
      onSubmit: () async {
        String result = await authViewmodel.login(
          _emailController.text,
          _passwordController.text
        );

        if(result == AuthViewmodel.success){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.home,
              (Route<dynamic> route) => false
            );
          });
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: ResponsiveText(
                text: result,
                fontSize: 5,
              ),
              behavior: SnackBarBehavior.floating,
              margin: EdgeInsets.only(bottom: screenHeight * 0.5),
            ),
          );
        }); 
      },
    /*
      footerWidgets: [
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
    */
    );
  }
}