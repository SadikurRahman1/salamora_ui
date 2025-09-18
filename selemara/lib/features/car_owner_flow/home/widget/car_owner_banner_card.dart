import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class CarOwnerBannerCard extends StatelessWidget {
  const CarOwnerBannerCard({super.key, required this.res});

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
            const Color(0xFF00A16E).withValues(alpha: 0.3),
            const Color(0xFF2563EB).withValues(alpha: 0.5),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                "welcome_back_a".tr, // translation key
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
          SizedBox(height: res.hp(4)),
          AppText(
            "track_your_car".tr, // translation key
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textColor626.withValues(alpha: 0.8),
          ),
        ],
      ),
    );
  }
}
