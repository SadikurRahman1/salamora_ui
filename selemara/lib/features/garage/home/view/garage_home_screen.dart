import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/features/garage/home/widget/banner_card.dart';

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
                    Image.asset(AppImages.userProfile),
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
                Image.asset(
                  AppIcons.notificationIconImage,
                  width: res.wp(30),
                  height: res.hp(30),
                ),
              ],
            ),
            SizedBox(height: res.hp(50)),
            BannerCard(res: res),
          ],
        ),
      ),
    );
  }
}

