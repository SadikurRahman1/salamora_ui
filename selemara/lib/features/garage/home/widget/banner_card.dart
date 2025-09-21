import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../common/widget/c_banner.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key, required this.res});

  final AppResponsive res;

  @override
  Widget build(BuildContext context) {
    return CBanner(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              AppText(
                "Elite Auto Service Center",
                // color: AppColors.textColor,
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
                color: AppColors.whitColor,
              ),
              SizedBox(width: res.wp(5)),
              AppText(
                "Dubai, UAE",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                // color: AppColors.textColor626.withValues(alpha: 0.8),
              ),
              SizedBox(width: res.wp(16)),
              Image.asset(
                AppIcons.car1,
                width: res.wp(20),
                height: res.wp(20),
                fit: BoxFit.contain,
                color: AppColors.whitColor,
              ),
              SizedBox(width: res.wp(5)),
              AppText(
                "+971 4 123 4567",
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
