import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import 'package:selemara/core/widgets/app_text.dart';

class ServiceRequestCard extends StatelessWidget {
  final String name;
  final String service;
  final String date;
  final String imagePath;
  final VoidCallback? onTap;

  ServiceRequestCard({
    super.key,
    required this.name,
    required this.service,
    required this.date,
    required this.imagePath,
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
        borderRadius: BorderRadius.circular(res.sp(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            offset: const Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          // Profile/Image
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: const Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                imagePath,
                width: res.wp(40),
                height: res.wp(40),
                fit: BoxFit.cover,
              ),
            ),
          ),

          SizedBox(width: res.wp(8)),

          // Text Info
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                name,
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
              SizedBox(height: res.hp(5)),
              Row(
                children: [
                  AppText(
                    service,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                  SizedBox(width: res.wp(5)),
                  Container(
                    width: res.wp(8),
                    height: res.wp(8),
                    decoration: BoxDecoration(
                      color: AppColors.textColor.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: res.wp(5)),
                  AppText(
                    "Date: $date",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ).onTap(onTap);
  }
}
