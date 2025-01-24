import 'package:flutter/material.dart';
import 'package:moveset/core/widgets/auth_screen.dart';
import 'package:moveset/core/widgets/custom_input_field.dart';
import 'package:moveset/viewmodel/auth_viewmodel.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final AuthViewmodel authViewmodel = Provider.of<AuthViewmodel>(context);

    return AuthScreen(
      title: 'Olá\nSeja bem vindo!',
      inputs: [
        CustomInputField(
          label: 'Nome',
          controller: _nameController,
        ),

        SizedBox(height: screenHeight * 0.03),

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

      buttonText: 'REGISTRAR-SE',
      onSubmit: () async => {
        await authViewmodel.register(
          _nameController.text,
          _emailController.text,
          _passwordController.text
        )
      },
    );
  }
}
