import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class CarOwnerFeatureCard extends StatelessWidget {
  final Color sideColor;
  final String cardText;
  final String? count;
  final String? icon;
  final AppResponsive res;

  const CarOwnerFeatureCard({
    super.key,
    required this.res,
    required this.sideColor,
    required this.cardText,
    this.icon,
    this.count,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: res.wp(160),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: res.wp(20),
              decoration: BoxDecoration(
                color: sideColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(res.sp(15)),
                  bottomLeft: Radius.circular(res.sp(15)),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: res.wp(5)),
            padding: EdgeInsets.symmetric(
              horizontal: res.hp(10),
              vertical: res.wp(10),
            ),
            decoration: BoxDecoration(
              color: AppColors.whitColor,
              borderRadius: BorderRadius.circular(res.sp(15)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withValues(alpha: 0.2),
                  offset: const Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 3,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min, // Let it wrap content
                  children: [
                    AppText(
                      cardText,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textColor.withValues(alpha: 0.8),
                    ),
                    SizedBox(height: res.hp(5)),
                    AppText(
                      count ?? "2",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor.withValues(alpha: 0.8),
                    ),
                  ],
                ),

                Image.asset(
                  icon ?? AppIcons.car,
                  width: res.wp(35),
                  height: res.hp(35),
                  fit: BoxFit.contain,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
