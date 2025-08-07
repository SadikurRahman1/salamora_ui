import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_button.dart';
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

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


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

            SizedBox(height: res.hp(24)),

            Row(
              children: [
                Expanded(
                  child: CustomButton(text: "Add Vehicle", onTap: () {}),
                ),

                SizedBox(width: res.wp(20)),

                Expanded(
                  child: CustomButton(text: "Add Vehicle", onTap: () {},btnColor: AppColors.orange,),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
