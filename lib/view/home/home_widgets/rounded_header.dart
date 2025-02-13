import 'package:flutter/material.dart';
import 'package:moveset/core/constants/app_colors.dart';
import 'package:moveset/core/widgets/responsive_text.dart';

class RoundedHeader extends StatelessWidget {
  final double responsiveHeight;
  final String title;

  const RoundedHeader({
    super.key,
    this.responsiveHeight = 0.3,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * responsiveHeight,
      decoration: BoxDecoration(
        color: AppColors.mainGray,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(100),
          bottomRight: Radius.circular(100)
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(
          top: 100
        ),
        child: ResponsiveText(
          text: title,
          fontSize: 5,
          align: TextAlign.center,
          style: TextStyle(
            color: AppColors.mainIceWhite,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}