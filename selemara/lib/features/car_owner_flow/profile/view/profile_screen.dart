import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/constants/token_key.dart';
import '../../../../core/helper/shared_preferences_helper.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';

import '../controller/profile_controller.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final res = AppResponsive();

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'profile'.tr, centerTitle: true),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: SingleChildScrollView(
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
                          height: res.wp(80),
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



              buildProfileOptionTile(

                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),


                ),


                bottomMargin: 0,
                padding: EdgeInsets.all(0),


                context,
                iconPath: AppImages.profileIcon,
                title: 'profile'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.editProfileScreen);                },
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
                        "notification".tr,
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



              buildProfileOptionTile(

                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),


                ),


                bottomMargin: 0,
                padding: EdgeInsets.all(0),


                context,
                iconPath: AppImages.lock,
                title: 'password'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.updatePasswordScreen);                },
              ),



              Container(
                margin: EdgeInsets.only(bottom: 15, top: 16),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),



              buildProfileOptionTile(


                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),


                ),


                bottomMargin: 0,
                padding: EdgeInsets.all(0),


                context,
                iconPath:  AppImages.privacy,
                title: 'privacy_policy'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);                },
              )




              ,Container(
                margin: EdgeInsets.only(bottom: 15, top: 16),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// Left side: icon + text
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.language,
                        height: res.hp(24),
                        width: res.wp(24),
                      ),
                      SizedBox(width: res.wp(16)),
                      AppText(
                        "language".tr,
                        color: AppColors.black,
                        fontSize: res.wp(15),
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),

                  /// Right side: dropdown
                  Obx(
                        () => DropdownButton<String>(
                      value: controller.selectedLang.value,
                      icon: const Icon(Icons.arrow_right, size: 26),
                      underline: SizedBox(),
                      onChanged: (value) {
                        if (value != null) {
                          controller.changeLang(value);
                        }
                      },
                      items: ["English", "Arabic"].map((String lang) {
                        return DropdownMenuItem<String>(
                          value: lang,
                          child: Text(lang),
                        );
                      }).toList(),
                    ),
                  ),                ],
              ),

              Container(
                margin: EdgeInsets.only(bottom: 15, top: 16),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),



              buildProfileOptionTile(
                boxDecoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(15),


                ),


                bottomMargin: 0,
                  padding: EdgeInsets.all(0),
                context,
                iconPath:AppIcons.customerSupport,
                title: 'help_support'.tr,
                onTap: () {

                  Get.toNamed(AppRoutes.helpSupportScreen);


                },
              ),


              Container(
                margin: EdgeInsets.only(bottom: 15, top: 16),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),

              buildProfileOptionTile(

                  textSize: 16,
                  bottomMargin: 0,
                  padding: EdgeInsets.all(0),

                  // optional
                  boxDecoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(15),
                  ),

                context,
                iconPath:AppImages.logout,
                title: 'logout'.tr,
                onTap: () {
                  showBeautifulBottomSheet(context);
                },
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
      ),
    );
  }

  void showBeautifulBottomSheet(BuildContext context) {
    final SharedPreferencesHelper preferencesHelper = SharedPreferencesHelper();

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
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
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
                "logout".tr,
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),

              SizedBox(height: res.hp(20)),

              Container(
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFf2f4f7)),
              ),
              SizedBox(height: res.hp(20)),
              AppText(
                "are_you_sure_you".tr,
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
                        text: "no".tr,
                        onTap: () {
                          Navigator.pop(context);


                        },
                        btnColor: AppColors.backGroundColor,
                        borderColor: AppColors.primaryColor,
                        isBorder: true,
                        textColor: AppColors.primaryColor,
                        borderRadius: 8,
                      ),
                    ),

                    SizedBox(width: res.wp(16)),

                    Expanded(
                      child: CustomButton(
                        text: "yes".tr,
                        onTap: () {

                          preferencesHelper.remove(TokenKey.accessToken);
                          Get.offAllNamed(AppRoutes.login);


                        },
                        borderRadius: 8,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: res.hp(20)),
            ],
          ),
        );
      },
    );
  }
}

Widget buildProfileOptionTile(
    BuildContext context, {
      required String iconPath,
      required String title,
      double? textSize,
      double? bottomMargin,
      EdgeInsets? padding,
      String? backArrow,
      BoxDecoration? boxDecoration,
      VoidCallback? onTap,
    }) {
  final res = AppResponsive();
  final isRTL = Directionality.of(context) == TextDirection.rtl;

  return Container(
    decoration: boxDecoration,
    margin: EdgeInsets.only(bottom: bottomMargin ?? 12),
    child: Material(
      color: AppColors.backGroundColor,
      child: InkWell(
        borderRadius: boxDecoration?.borderRadius as BorderRadius? ??
            BorderRadius.circular(0),
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Padding(
          padding: padding ??
              EdgeInsets.only(
                top: res.hp(12),
                left: res.wp(12),
                right: res.wp(12),
              ),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.asset(
                      iconPath,
                      height: res.hp(24),
                      width: res.wp(24),
                    ),
                    SizedBox(width: res.wp(12)),
                    Flexible(
                      child: AppText(
                        title,
                        color: AppColors.black,
                        fontSize: textSize ?? 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              backArrow == null
                  ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(isRTL ? math.pi : 0), // ✅ Flip RTL
                child: Image.asset(
                  AppImages.backArrow,
                  height: res.hp(24),
                  width: res.wp(24),
                ),
              )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    ),
  );
}
