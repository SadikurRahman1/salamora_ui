import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class GarageHomeScreen extends StatelessWidget {
  const GarageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
        child: Column(
          children: [
            SizedBox(height: res.hp(70)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset("assets/images/user_profile.png"),
                    SizedBox(width: res.wp(5)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          "John Doe",
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        AppText(
                          "Garage",
                          color: AppColors.textColor.withValues(alpha: 0.8),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                  ),
                  child: Image.asset(AppIcons.notificationIcon),
                ),
              ],
            ),
            Container(
              width: res.screenWidth,
              height: res.hp(130),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(res.sp(16)),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFF00A16E).withValues(alpha: 0.5),
                    Color(0xFF2563EB),
                  ],
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      AppText(
                        "Elite Auto Service Center",
                        color: AppColors.textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      
                      Image.asset(AppIcons.cardTrust),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
