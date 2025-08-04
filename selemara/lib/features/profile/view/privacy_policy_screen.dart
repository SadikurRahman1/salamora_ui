import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/custom_appbar.dart';

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
                "Introduction",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),

              SizedBox(height: res.hp(8)),
              AppText(
                "We value your privacy and are committed to protecting your personal information. By using [App Name], you agree to the collection and use of your data as described in this policy.",
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),
              SizedBox(height: res.hp(24)),

              AppText(
                "Information We Collect",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(8)),

              AppText(
                "We may collect:",
                fontWeight: FontWeight.w400,
                fontSize: res.sp(14),
                color: AppColors.textColor7085,
              ),

              buildDotSeparatedText(
                "Personal Information: Name, email, phone number, and payment details.",
              ),
              buildDotSeparatedText(
                "Location Data: To show nearby car wash services.",
              ),
              buildDotSeparatedText(
                "Usage Data: App interactions and preferences",
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                "How We Use Your Data",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(8)),

              AppText(
                "Your information is used to:",
                fontWeight: FontWeight.w400,
                fontSize: res.sp(14),
                color: AppColors.textColor7085,
              ),

              buildDotSeparatedText("Facilitate bookings and payments."),
              buildDotSeparatedText("Improve app functionality."),

              buildDotSeparatedText("Send updates and offers."),

              SizedBox(height: res.hp(24)),

              AppText(
                "Sharing Your Data",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "We only share data with trusted service providers, car wash partners, or legal authorities when required.",
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                " Security",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "We use secure methods to protect your data but cannot guarantee complete security.",
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                " Your Rights",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "You can access, update, or delete your data and opt-out of communications at any time.",
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
                fontSize: res.sp(14),
              ),

              SizedBox(height: res.hp(24)),

              AppText(
                " Contact Us",
                fontWeight: FontWeight.w500,
                fontSize: res.sp(16),
                color: AppColors.textColor2939,
              ),
              SizedBox(height: res.hp(10)),

              AppText(
                "For questions or concerns, email us at [Insert Email].",
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
