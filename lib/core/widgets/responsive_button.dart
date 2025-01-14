import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';

class ResponsiveButton extends StatelessWidget {
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

  const ResponsiveButton({
    required this.text,
    super.key,
    required this.onPressed,
    this.width = 70,
    this.height = 7,
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    
    return GestureDetector(
      onTap: onPressed,

      child: Container(
        width: screenWidth * (width / 100),
        height: screenHeight * (height / 100),
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