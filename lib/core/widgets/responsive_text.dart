import 'package:flutter/material.dart';

class ResponsiveText extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? align;
  final TextStyle? style;

  const ResponsiveText({
    super.key,
    required this.text,
    required this.fontSize,
    this.align = TextAlign.justify,
    this.style
  });

  @override
  Widget build(BuildContext context) {
    // obtem a largura da tela
    final double screenWidth = MediaQuery.of(context).size.width;

    // calcula o tamanho da fonte baseado na largura da tela
    final double adjustedFontSize = screenWidth * (fontSize / 100);

    return Text(
      text,
      textAlign: align,
      style: style?.copyWith(fontSize: adjustedFontSize) ?? TextStyle(fontSize: adjustedFontSize),
    );
  }
}