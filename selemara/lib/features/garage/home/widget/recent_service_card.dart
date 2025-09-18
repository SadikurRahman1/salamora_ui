import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import 'package:selemara/core/widgets/app_text.dart';

class RecentServiceCard extends StatelessWidget {
  final String titleText;
  final String subTitleText;
  final String currentStatus;
  final VoidCallback? onTap;

  RecentServiceCard({
    super.key,
    required this.titleText,
    required this.subTitleText,
    required this.currentStatus,
    this.onTap,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.hp(10),
        vertical: res.wp(16),
      ),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(res.sp(15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: res.wp(8),
                height: res.wp(8),
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: res.wp(10)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    titleText,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                  SizedBox(height: res.hp(5)),
                  AppText(
                    subTitleText,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: AppColors.yallowColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(res.sp(20)),
            ),
            child: AppText(
              currentStatus,
              color: AppColors.yallowColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    ).onTap(onTap);
  }
}
