import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/edit_profile_controller.dart';
import '../widget/custom_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final controller = Get.put(EditProfileController());

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_profile'.tr,
        leading: Container(
          height: res.hp(10),
          width: res.wp(10),
          child: Image.asset(
            AppImages.beckButton,
            height: res.hp(10),
            width: res.wp(10),
          ),
        ),
      ),

      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                  borderRadius: BorderRadius.circular(
                                    res.wp(40),
                                  ),

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
                        ],
                      ),
                    ),

                    SizedBox(height: res.hp(20)),

                    AppText(
                      "name".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.nameController,
                      hintText: 'name_hint'.tr,
                    ),

                    SizedBox(height: res.hp(20)),

                    AppText(
                      "phone_number".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.phoneController,
                      hintText: 'phone_number_hint'.tr,
                    ),

                    SizedBox(height: res.hp(20)),

                    AppText(
                      "email".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.emailController,
                      hintText: 'enter_email'.tr,
                    ),

                    SizedBox(height: res.hp(20)),

                    AppText(
                      "bio".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      minLine: 2,
                      maxLine: 5,
                      controller: controller.dateBirthController,
                      hintText: 'enter_your_details'.tr,
                    ),


                    SizedBox(height: res.hp(38)),



                  ],
                ),
              ),
            ),

            CustomButton(text: "update_profile".tr, onTap: () {}),
            SizedBox(height: res.hp(24)),
          ],
        ),
      ),
    );
  }
}
