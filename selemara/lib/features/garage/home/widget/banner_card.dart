import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.res});

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
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFF00A16E).withValues(alpha: 0.3),
        //     Color(0xFF2563EB).withValues(alpha: 0.5),
        //   ],
        // ),
        color: AppColors.lightGray
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                "Elite Auto Service Center",
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(width: res.wp(10)),
              Image.asset(
                AppIcons.cardTrust,
                width: res.wp(20),
                height: res.wp(20),
                fit: BoxFit.contain,
              ),
            ],
          ),
          SizedBox(height: res.hp(12)),
          Row(
            children: [
              Image.asset(
                AppIcons.markersIcon,
                width: res.wp(16),
                height: res.wp(16),
                fit: BoxFit.cover,
              ),
              SizedBox(width: res.wp(5)),
              AppText(
                "Dubai, UAE",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor626.withValues(alpha: 0.8),
              ),
              SizedBox(width: res.wp(16)),
              Image.asset(
                AppIcons.car1,
                width: res.wp(20),
                height: res.wp(20),
                fit: BoxFit.contain,
              ),
              SizedBox(width: res.wp(5)),
              AppText(
                "+971 4 123 4567",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor626.withValues(alpha: 0.8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
