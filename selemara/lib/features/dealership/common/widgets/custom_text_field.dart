import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? borderColor;
  final double? borderRadius;
  final int? maxLine;
  final int? minLine;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.borderColor,
    this.borderRadius,
    this.maxLine,
    this.minLine,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine ?? 3,
      minLines: minLine ?? 1,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF667085), // Set hint text color
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderEditText,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderEditText,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 8),
          borderSide: BorderSide(
            color: borderColor ?? AppColors.borderEditText,
            width: 1,
          ),
        ),
      ),
    );
  }
}
