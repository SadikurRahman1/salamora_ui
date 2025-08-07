import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextInter extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppTextInter(
    this.text, {
    super.key,
    this.color = const Color(0xFFFFFFFF),
    this.fontSize = 14,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
   
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines ,
      overflow: overflow,
      style: GoogleFonts.inter(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
