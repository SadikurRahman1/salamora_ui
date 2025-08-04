import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final Color btnColor;
  final String text;
  final VoidCallback onTap;
  final bool isBorder;
  final Color? textColor;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.onTap,
    this.isBorder = false,
    this.btnColor = AppColors.primaryColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: height ?? responsive.wp(327),
        height: width ?? responsive.hp(46),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnColor,
          border: isBorder ? Border.all(color: AppColors.borderColor) : null,
          borderRadius: BorderRadius.circular(responsive.wp(20)),
        ),
        child: AppText(text, color: textColor ?? Color(0xFFFFFFFF)),
      ),
    );
  }
}
