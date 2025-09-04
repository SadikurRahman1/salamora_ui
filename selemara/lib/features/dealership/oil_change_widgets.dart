import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';

import '../../core/constants/app_colors.dart';
import '../../core/widgets/app_text.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String date;
  final String company;
  final String miles;

  const InfoCard({
    super.key,
    required this.title,
    required this.date,
    required this.company,
    required this.miles,
  });

  @override
  Widget build(BuildContext context) {

    final res = AppResponsive();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      margin: const EdgeInsets.symmetric( vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.geryColor.withAlpha(40),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            title,
            color: AppColors.textColor,
          ),
          SizedBox(height: res.hp(6)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(AppIcons.remindersInactive, width: 16,),
                  SizedBox(width: res.wp(8)),
                  AppText(
                    date,
                    fontSize: 12,
                    color: AppColors.textColor2B2B,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),

              Row(
                children: [
                  Image.asset(AppIcons.location, width: 16,),
                  SizedBox(width: res.wp(8)),
                  AppText(
                    company,
                    fontSize: 12,
                    color: AppColors.textColor2B2B,
                    fontWeight: FontWeight.w400,
                  ),
                ],
              ),

              Row(
                children: [
                  Image.asset(AppIcons.carInActive, width: 16,),
                  SizedBox(width: res.wp(8)),
                  AppText(
                    miles,
                    fontSize: 12,
                    color: AppColors.textColor2B2B,
                    fontWeight: FontWeight.w400,
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
