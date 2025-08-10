import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';

class WarrantyDetailsScreen extends StatelessWidget {
  WarrantyDetailsScreen({super.key});

  final res = AppResponsive();
  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "warranty_details".tr,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: AppText(
                "car_garage_info".tr,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "car_toyota_axio_2017".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "serviced_by_autocare_garage".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "location_gulshan_dhaka".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "service_date_15_july_2025".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: AppText(
                "warranty_information".tr,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "warranty_information".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "warranty_provider_honda_uae".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "location_gulshan_dhaka".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "covered_services".tr,
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
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFeaf0fd),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "engine_checkup".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(width: res.wp(17)),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFeaf0fd),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "oil_change".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  SizedBox(width: res.wp(17)),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFeaf0fd),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "ac_service".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Color(0xFFeaf0fd),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "brake_inspection".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: AppText(
                "terms_conditions".tr,
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "warranty_valid_services_only".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "accident_damage_not_covered".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "show_warranty_before_service".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: AppText(
                "one_time_use_per_service".tr,
                color: AppColors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: CustomButton(
                textIconWidth: 5,
                text: "download".tr,
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
