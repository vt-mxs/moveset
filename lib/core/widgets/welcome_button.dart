import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';

class WelcomeButton extends StatelessWidget {
  //final Widget child;
  final String text;
  final VoidCallback onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final Border? border;
  final Color? color;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final TextStyle textStyle;

  const WelcomeButton({
    required this.text,
    super.key,
    required this.onPressed,
    this.width = 300,
    this.height = 65,
    this.color,
    this.borderRadius = 30,
    this.border,
    this.textStyle = const TextStyle(
      color: AppColors.mainIceWhite,
      fontSize: 10,
      fontWeight: FontWeight.bold
    ),
    this.constraints,
    this.padding = const EdgeInsets.only(top: 19)
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(borderRadius),
          border: border
        ),

        child: Text(
          text,
          style: textStyle,
        ),
      ),
    );
  }
}