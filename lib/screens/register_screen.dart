import 'package:flutter/material.dart';
import 'package:moveset/core/widgets/auth_screen.dart';
import 'package:moveset/core/widgets/custom_input_field.dart';

class RegisterScreen extends StatelessWidget{
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context){
    final double screenHeight = MediaQuery.of(context).size.height;

    return AuthScreen(
      title: 'Olá\nSeja bem vindo!',
      inputs: [
        CustomInputField(label: 'Nome'),

        SizedBox(height: screenHeight * 0.03),

        CustomInputField(label: 'Email'),

        SizedBox(height: screenHeight * 0.03),

        CustomInputField(
          label: 'Senha',
          isPassword: true,
        ),
      ],
      buttonText: 'REGISTRAR-SE',
      onSubmit: () => {print('oi')}
    );
  }
}