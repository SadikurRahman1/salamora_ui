import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';

class WarrantyDetailsScreen extends StatelessWidget {
  WarrantyDetailsScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Warranty Details",

        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: AppText(
                "Car & Garage Info",
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "Car: Toyota Axio 2017",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Serviced By: AutoCare Garage",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Location: 123, Gulshan, Dhaka",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Service Date: 15 July 2025",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),
            SliverToBoxAdapter(
              child: AppText(
                "Warranty Information",
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "Warranty Information",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Warranty Provider: Honda UAE",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Location: 123, Gulshan, Dhaka",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Covered Services:",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: Wrap(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 12),

                    child: CustomButton(
                      textIconWidth: 0,

                      width: 110,
                      height: 24,

                      text: "Engine Checkup",
                      onTap: () {},
                      textColor: AppColors.primaryColor,
                      btnColor: Color(0xFFeaf0fd),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: res.wp(17)),

                  Container(
                    padding: EdgeInsets.only(bottom: 12),

                    child: CustomButton(
                      textIconWidth: 0,
                      width: 79,
                      height: 30,
                      text: "Oil Change",
                      fontSize: 12,
                      onTap: () {},
                      textColor: AppColors.primaryColor,
                      btnColor: Color(0xFFeaf0fd),
                    ),
                  ),
                  SizedBox(width: res.wp(17)),

                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: CustomButton(
                      textIconWidth: 0,
                      width: 80,
                      height: 24,
                      text: "AC Service",
                      onTap: () {},
                      fontSize: 12,
                      textColor: AppColors.primaryColor,
                      btnColor: Color(0xFFeaf0fd),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.only(bottom: 12),
                    child: CustomButton(
                      textIconWidth: 0,
                      width: 110,
                      height: 24,
                      text: "Brake Inspection",
                      onTap: () {},
                      fontSize: 12,
                      textColor: AppColors.primaryColor,
                      btnColor: Color(0xFFeaf0fd),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: AppText(
                "Terms & Conditions",
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "This warranty is only valid for the listed services.",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "Any damage due to accidents is not covered.",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "You must show this warranty screen before service.",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "One-time use per service type.",
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: CustomButton(
                textIconWidth: 5,

                text: "Download",
                iconPath: AppIcons.download,

                onTap: () {},
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(28))),
          ],
        ),
      ),
    );
  }
}
