import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/profile/controller/profile_controller.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../widget/profile_option_tile.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final res = AppResponsive();

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Profile', centerTitle: true),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: Column(
          children: [
            SizedBox(height: res.hp(0)),
            Align(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        alignment: Alignment.topCenter,
                        height: res.hp(80),
                        width: res.wp(80),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(80),
                          border: Border.all(
                            width: 7,

                            color: AppColors.profileBorderColor,
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(res.wp(40)),

                          // half-width for a perfect circle
                          child: Image.asset(
                            AppImages.manIcon,
                            height: res.hp(80),
                            width: res.wp(80),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Positioned(
                        bottom: 10,
                        right: 20,
                        child: GestureDetector(
                          child: Image.asset(
                            AppImages.edit,
                            height: res.hp(32),
                            width: res.wp(32),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),

                  AppText(
                    "Abdur Rahim",
                    fontSize: res.sp(20),
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryTextColor,
                  ),
                ],
              ),
            ),

            SizedBox(height: res.hp(20)),

            ProfileOptionTile(
              onTap: () {
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              iconPath: AppImages.profileIcon,
              title: 'Profile',

              textSize: 16,
              bottomMargin: 0,
              padding: EdgeInsets.all(0),

              // optional
              boxDecoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Row(
                  children: [
                    Image.asset(
                      AppImages.notification,
                      height: res.hp(24),
                      width: res.wp(24),
                    ),
                    SizedBox(width: res.wp(12)),

                    AppText(
                      "Notification",
                      color: const Color(0xFF262626),
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Static icon + "Dark Mode" label

                    // ✅ Only the Switch wrapped in Obx — thanks to .value reference
                    Obx(
                      () => Switch(
                        value: controller.isDarkMode.value,
                        onChanged: (val) => controller.toggleTheme(),
                        inactiveThumbColor: Color(0xFF888888),
                        inactiveTrackColor: Colors.transparent,
                        activeColor: AppColors.primaryColor,
                        activeTrackColor: const Color(0xFFd8d8d8),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 10),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            ProfileOptionTile(
              iconPath: AppImages.lock,
              title: 'Password',
              onTap: () {
                Get.toNamed(AppRoutes.updatePasswordScreen);
              },
              textSize: 16,
              bottomMargin: 0,
              padding: EdgeInsets.all(0),

              // optional
              boxDecoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            ProfileOptionTile(
              iconPath: AppImages.privacy,
              title: 'Privacy Policy',
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen);
              },
              textSize: 16,
              bottomMargin: 0,
              padding: EdgeInsets.all(0),

              // optional
              boxDecoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            ProfileOptionTile(
              iconPath: AppImages.logout,
              title: 'Logout',
              onTap: () {
                showBeautifulBottomSheet(context);
              },
              textSize: 16,
              bottomMargin: 0,
              padding: EdgeInsets.all(0),

              // optional
              boxDecoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(15),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),
          ],
        ),
      ),
    );
  }

  void showBeautifulBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // Transparent to show rounded corners
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(70),
              topRight: Radius.circular(70),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                "Logout",
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
              SizedBox(height: res.hp(40)),
              AppText(
                "Are you sure you want to log out?",
                color: Color(0xFF344054),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),

              SizedBox(height: res.hp(24)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "No",
                        onTap: () {},
                        btnColor: AppColors.backGroundColor,
                        borderColor: AppColors.primaryColor,
                        isBorder: true,
                        textColor: AppColors.primaryColor,
                        borderRadius: 8,

                      ),
                    ),

                    SizedBox(width: res.wp(16)),

                    Expanded(
                      child: CustomButton(text: "Yes", onTap: () {},
                        borderRadius: 8,

                      ),
                    ),




                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
