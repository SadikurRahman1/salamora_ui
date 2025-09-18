import 'package:flutter/material.dart';

import '../../../../core/widgets/app_text.dart';

class ThreeColumnTextRow extends StatelessWidget {
  final String firstText;
  final String secondText;
  final String thirdText;

  final int firstFlex;
  final int secondFlex;
  final int thirdFlex;

  final Color firstColor;
  final Color secondColor;
  final Color thirdColor;

  final double firstFontSize;
  final double secondFontSize;
  final double thirdFontSize;

  final FontWeight firstFontWeight;
  final FontWeight secondFontWeight;
  final FontWeight thirdFontWeight;

  const ThreeColumnTextRow({
    super.key,
    required this.firstText,
    required this.secondText,
    required this.thirdText,
    this.firstFlex = 3,
    this.secondFlex = 3,
    this.thirdFlex = 3,
    this.firstColor = const Color(0xFF5E6470),
    this.secondColor = const Color(0xFF5E6470),
    this.thirdColor = const Color(0xFF5E6470),
    this.firstFontSize = 11,
    this.secondFontSize = 11,
    this.thirdFontSize = 11,
    this.firstFontWeight = FontWeight.w500,
    this.secondFontWeight = FontWeight.w500,
    this.thirdFontWeight = FontWeight.w500,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: firstFlex,
          child: AppText(
            firstText,
            color: firstColor,
            fontSize: firstFontSize,
            fontWeight: firstFontWeight,
          ),
        ),
        Expanded(
          flex: secondFlex,
          child: AppText(
            secondText,
            color: secondColor,
            fontSize: secondFontSize,
            fontWeight: secondFontWeight,
          ),
        ),
        Expanded(
          flex: thirdFlex,
          child: AppText(
            thirdText,
            color: thirdColor,
            fontSize: thirdFontSize,
            fontWeight: thirdFontWeight,
          ),
        ),
      ],
    );
  }
}
