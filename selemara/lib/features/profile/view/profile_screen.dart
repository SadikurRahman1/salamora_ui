import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/profile/controller/profile_controller.dart';

import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../widget/profile_option_tile.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

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

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              child: ProfileOptionTile(
                iconPath: AppImages.profileIcon,
                title: 'Profile',

                textSize: 12,
                bottomMargin: 0,
                padding: EdgeInsets.all(0),

                // optional
                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
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

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.updatePasswordScreen);
              },
              child: ProfileOptionTile(
                iconPath: AppImages.lock,
                title: 'Password',

                textSize: 12,
                bottomMargin: 0,
                padding: EdgeInsets.all(0),

                // optional
                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            GestureDetector(
              onTap: () {
                Get.toNamed(AppRoutes.privacyPolicyScreen);
              },
              child: ProfileOptionTile(
                iconPath: AppImages.privacy,
                title: 'Privacy Policy',

                textSize: 12,
                bottomMargin: 0,
                padding: EdgeInsets.all(0),

                // optional
                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, top: 16),
              width: double.infinity,
              height: 1,
              decoration: BoxDecoration(color: Color(0xFFEAECF0)),
            ),

            GestureDetector(
              onTap: () {

                Get.toNamed(AppRoutes.updatePasswordScreen);



              },
              child: Column(
                children: [
                  ProfileOptionTile(
                    iconPath: AppImages.logout,
                    title: 'Logout',

                    textSize: 12,
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
          ],
        ),
      ),
    );
  }
}
