import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/widgets/responsive_text.dart';

class CustomInputField extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController? controller;


  const CustomInputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        label: ResponsiveText(
          text: label,
          fontSize: 5,
          style: TextStyle(color: AppColors.mainGray),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.mainShowCaseBlue)
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: AppColors.mainShowCaseBlue)
        )
      ),
    );
  }
}