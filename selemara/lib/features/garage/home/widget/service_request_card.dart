import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class ServiceRequestCard extends StatelessWidget {
  final AppResponsive res;
  const ServiceRequestCard({super.key, required this.res});

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
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/icons/profile_home.png",
                width: res.wp(40),
                height: res.wp(40),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: res.wp(5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "Ahmed Al Mansouri",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
              SizedBox(height: res.hp(5)),
              Row(
                children: [
                  AppText(
                    "Oil Change",
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
                    "Date: 1/20/2024",
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
    );
  }
}
