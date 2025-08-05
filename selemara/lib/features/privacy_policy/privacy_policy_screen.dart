import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../core/constants/app_colors.dart';
import '../../core/constants/app_images.dart';
import '../../core/constants/app_responsive.dart';
import '../../core/widgets/custom_appbar.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  PrivacyPolicyScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Privacy Policy',
        leading: Image.asset(AppImages.beckButton),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),

        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: res.hp(28)),

              AppText(
                "introduction".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),

              SizedBox(height: res.hp(8)),
              AppText(

                "we_value_your_privacy".tr,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),
              SizedBox(height: res.hp(24)),

              AppText(
                "information_we_collect".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(8)),

              AppText(
                "we_may_collect".tr,
                fontWeight: FontWeight.w400,
                fontSize: res.sp(14),
                color: AppColors.textColor7085,
              ),

              buildDotSeparatedText(
                "personal_information".tr,
              ),
              buildDotSeparatedText(
                "location_data".tr,
              ),
              buildDotSeparatedText(
                "usage_data_app".tr,
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                "how_we_use_your".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(8)),

              AppText(
                "your_information_is".tr,
                fontWeight: FontWeight.w400,
                fontSize: res.sp(14),
                color: AppColors.textColor7085,
              ),

              buildDotSeparatedText("facilitate_bookings_and".tr),
              buildDotSeparatedText("improve_app_functionality".tr),

              buildDotSeparatedText("send_updates_and_offers".tr),

              SizedBox(height: res.hp(24)),

              AppText(
                "sharing_your_ata".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "we_only_share_data".tr,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                "security".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "we_use_secure_methods".tr,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                "your_rights".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "you_can_access_update".tr,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                "contact_us".tr,
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "for_questions_or".tr,
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),



            ],
          ),
        ),
      ),
    );
  }

  Widget buildDotSeparatedText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: res.wp(10),
            vertical: res.hp(12),
          ),
          height: res.hp(5),
          width: res.wp(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: AppColors.textColor7085,
          ),
        ),

        Flexible(
          child: AppText(
            text,
            fontWeight: FontWeight.w400,
            fontSize: res.sp(14),
            color: AppColors.textColor7085,
          ),
        ),
      ],
    );
  }
}
