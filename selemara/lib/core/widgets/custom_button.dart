import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? iconHeight;
  final double? iconWidth;
  final double? fontSize;
  final Color btnColor;
  final double? textIconWidth;
  final String text;
  final VoidCallback onTap;
  final bool isBorder;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;

  final double? borderRadius;
  final String? iconPath;

  const CustomButton({
    super.key,
    this.height,
    this.width,
    required this.text,
    required this.onTap,
    this.isBorder = false,
    this.btnColor = AppColors.primaryColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
    this.iconPath, this.iconHeight, this.iconWidth, this.iconColor, this.fontSize, this.textIconWidth,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive();
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? responsive.wp(327),
        height: height ?? responsive.hp(46),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: btnColor,
          border:
              isBorder
                  ? Border.all(color: borderColor ?? AppColors.borderColor)
                  : null,
          borderRadius: BorderRadius.circular(
            responsive.wp(borderRadius ?? responsive.sp(20)),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconPath != null
                ? Image.asset(
                  iconPath ?? AppIcons.plus,
                  color:iconColor?? AppColors.whitColor,
                
            height: responsive.hp(iconHeight??20,),
              width: responsive.wp(iconWidth??20),
            )
                : SizedBox.shrink(),
            SizedBox(width: responsive.wp(textIconWidth??10)),
            AppText(text, color: textColor ?? Color(0xFFFFFFFF),

            fontSize:fontSize?? 14,
            ),
          ],
        ),
      ),
    );
  }
}
