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
import '../../../common/widget/c_toggle_button.dart';
import '../../widget/profile_header.dart';
import '../controller/my_profile_controller.dart';
import 'package:get/get.dart';

import '../widgets/buyer_profile_option_tile.dart';
import 'profile_password_change_screen.dart';
import 'profile_edit_screen.dart';
import 'profile_help_support_screen.dart';
import 'garage_service_screen.dart';

class MyProfileScreen extends StatelessWidget {
  MyProfileScreen({super.key});

  final res = AppResponsive();
  final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyProfileController>();

    return Scaffold(
      appBar: CustomAppBar(title: 'profile'.tr, centerTitle: true),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: res.hp(0)),

              ProfileHeader(
                image: AppImages.manIcon,
                name: "ElitePolish Auto Care",
                location: "3885 Al Bandanna Street",
                onEdit: () {
                  Get.to(() => ProfileEditScreen());
                },
              ),

              SizedBox(height: res.hp(20)),

              BuyerProfileOptionTile(
                onTap: () {
                  Get.to(() => GarageProfileSecondScreen());
                },
                iconPath: AppImages.profileIcon,
                title: 'profile'.tr,
                textSize: 16,
                bottomMargin: 0,
                padding: EdgeInsets.all(0),

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
                        "notification".tr,
                        color: const Color(0xFF262626),
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ],
                  ),

                  ////
                  CToggleButton(
                    value: controller.isActive,
                    onChanged: (val) {
                      controller.isActive.value = val;
                    },
                  ),
                ],
              ),

              Container(
                margin: EdgeInsets.only(bottom: 15, top: 10),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),

              BuyerProfileOptionTile(
                iconPath: AppImages.lock,
                title: 'password'.tr,
                onTap: () {
                  // Get.toNamed(AppRoutes.buyerChangePasswordScreen);
                  Get.to(() => ProfilePasswordChangeScreen());
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

              BuyerProfileOptionTile(
                iconPath: AppImages.privacy,
                title: 'privacy_policy'.tr,
                onTap: () {
                  Get.toNamed(AppRoutes.privacyPolicyScreen);
                  // Get.to();
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
                      items:
                          ["English", "Arabic"].map((String lang) {
                            return DropdownMenuItem<String>(
                              value: lang,
                              child: Text(lang),
                            );
                          }).toList(),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 15, top: 16),
                width: double.infinity,
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFEAECF0)),
              ),

              BuyerProfileOptionTile(
                iconPath: AppIcons.customerSupport,
                title: 'help_support'.tr,
                onTap: () {
                  Get.to(ProfileHelpSupportScreen());
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

              BuyerProfileOptionTile(
                iconPath: AppImages.logout,
                title: 'logout'.tr,
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
                          Get.back();
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
                        btnColor: AppColors.primaryColor,
                        text: "yes".tr,
                        onTap: () async {
                          await _preferencesHelper.remove(TokenKey.accessToken);
                          await _preferencesHelper.remove(TokenKey.userId);
                          await _preferencesHelper.remove(TokenKey.role);

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
