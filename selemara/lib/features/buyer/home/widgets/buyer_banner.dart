import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class BuyerBanner extends StatelessWidget {
  const BuyerBanner({super.key, required this.res});

  final AppResponsive res;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: res.screenWidth,

      padding: EdgeInsets.symmetric(
        horizontal: res.wp(16),
        vertical: res.hp(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(res.sp(16)),
        gradient: LinearGradient(
          colors: [
            Color(0xFF00A16E).withValues(alpha: 0.3),
            Color(0xFF2563EB).withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            "welcome back. !",
            color: AppColors.textColor,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          SizedBox(height: res.hp(5)),
          AppText(
            "find_verified_cars".tr,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor626.withValues(alpha: 0.8),
          ),
          SizedBox(height: res.hp(5)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  AppText(
                    "2",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor626,
                  ),
                  AppText(
                    "search_car".tr,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor626,
                  ),
                ],
              ),
              Column(
                children: [
                  AppText(
                    "8",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor626,
                  ),
                  AppText(
                    "qr_scans".tr,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor626,
                  ),
                ],
              ),
              Column(
                children: [
                  AppText(
                    "3",
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textColor626,
                  ),
                  AppText(
                    "qr_scans".tr,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textColor626,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
