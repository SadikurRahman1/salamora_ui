import 'package:flutter/material.dart';

class InvoiceRowText extends StatelessWidget {
  final String leftText;
  final String rightText;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;

  const InvoiceRowText({
    super.key,
    required this.leftText,
    required this.rightText,
    this.color = const Color(0xFF5E6470),
    this.fontSize = 12,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            leftText,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
        Expanded(
          child: Text(
            rightText,
            textAlign: TextAlign.end,
            style: TextStyle(
              color: color,
              fontWeight: fontWeight,
              fontSize: fontSize,
            ),
          ),
        ),
      ],
    );
  }
}
