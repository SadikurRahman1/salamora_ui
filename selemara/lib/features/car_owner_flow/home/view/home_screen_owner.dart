import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/features/car_owner_flow/home/widget/information_card.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../widget/custom_home_appbar.dart';

class HomeScreenOwner extends StatelessWidget {
  HomeScreenOwner({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHomeAppbar(),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: res.hp(32)),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xFFbce5da), // Green
                    Color(0xFF93b2f4), // Light Blue
                  ],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text Column
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        AppText(
                          'Welcome back. !',

                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: AppColors.secondryTextColor,
                        ),
                        SizedBox(height: 4),
                        AppText(
                          "Track your car's service history and stay on top of maintenance",
                          fontSize: 14,
                          color: AppColors.textColor2939,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),

                  // Icon
                  Image.asset(
                    AppIcons.check,
                    height: res.hp(24),
                    width: res.wp(24),
                  ),
                ],
              ),
            ),
            SizedBox(height: res.hp(24)),
            Row(
              children: [
                // Left Card
                Expanded(
                  child: InformationCard(
                    backgroundColor: AppColors.primaryColor,
                    iconPath: AppIcons.car,
                    title: 'My Vehicles',
                    value: '2',
                    height: res.hp(67),
                    iconSize: res.hp(32),
                  ),
                ),

                SizedBox(width: res.wp(20)),
                Expanded(
                  child: InformationCard(
                    backgroundColor: AppColors.greenColor,
                    iconPath: AppIcons.check1,
                    title: 'Service Records',
                    value: '23',
                    height: res.hp(67),
                    iconSize: res.hp(32),
                  ),
                ),
              ],
            ),

            SizedBox(height: res.hp(16)),
            Row(
              children: [
                // Left Card
                Expanded(
                  child: InformationCard(
                    backgroundColor: AppColors.orange,
                    iconPath: AppIcons.notificationHome,
                    title: 'Alerts',
                    value: '5',
                    height: res.hp(67),
                    iconSize: res.hp(32),
                  ),
                ),

                SizedBox(width: res.wp(20)),
                Expanded(
                  child: InformationCard(
                    backgroundColor: AppColors.orange,
                    iconPath: AppIcons.dueSoon,
                    title: 'Due Soon',
                    value: '3',
                    height: res.hp(67),
                    iconSize: res.hp(32),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
