import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../core/constants/app_responsive.dart';

class ProfileOptionTile extends StatelessWidget {
  final String iconPath;
  final String title;
  final double? textSize;
  final double? bottomMargin;
  final EdgeInsets? padding;
  final String? backArrow;
  final BoxDecoration? boxDecoration;


  const ProfileOptionTile({
    super.key,
    required this.iconPath,
    required this.title,

    this.bottomMargin,
    this.boxDecoration,
    this.padding,
    this.backArrow,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Container(
      padding:
          padding ??
          EdgeInsets.only(

            top: res.hp(12),
            left: res.wp(12),
            right: res.wp(12),
          ),

      margin: EdgeInsets.only(bottom: bottomMargin ?? 12),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                Image.asset(iconPath, height: res.hp(24), width: res.wp(24)),
                SizedBox(width: res.wp(12)),
                Flexible(
                  child: AppText(
                    title,

                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          backArrow == null
              ? Image.asset(
                AppImages.backArrow,
                height: res.hp(24),
                width: res.wp(24),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
