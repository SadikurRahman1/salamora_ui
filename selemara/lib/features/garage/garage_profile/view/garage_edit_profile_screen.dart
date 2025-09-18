

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/garage_edit_profile_controller.dart';
import '../widgets/buyer_custom_text_field.dart';


class GarageEditProfileScreen extends StatelessWidget {
  GarageEditProfileScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(GarageEditProfileController());

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_profile'.tr,
        leading: SizedBox(
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
                child: Form(
                  key: _formKey,
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

                      BuyerCustomTextField(
                        controller: controller.nameController,
                        hintText: 'name_hint'.tr,
                      ),

                      SizedBox(height: res.hp(20)),

                      AppText(
                        "email".tr,
                        color: AppColors.textColor2939,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      SizedBox(height: res.hp(8)),

                      BuyerCustomTextField(
                        controller: controller.emailController,
                        hintText: "your Email".tr,
                      ),
                      //
                      SizedBox(height: res.hp(20)),

                      AppText(
                        "address".tr,
                        color: AppColors.textColor2939,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                      SizedBox(height: res.hp(8)),

                      BuyerCustomTextField(
                        controller: controller.addressController,
                        hintText: 'address'.tr,
                      ),

                      SizedBox(height: res.hp(20)),



                      SizedBox(height: res.hp(38)),



                    ],
                  ),
                ),
              ),
            ),

            CustomButton(
              btnColor: AppColors.primaryColor,
              isLoading: controller.isLoading.value,
              text: "update_profile".tr,
              onTap: ()  {},
            ),
            SizedBox(height: res.hp(24)),
          ],
        ),
      ),
    );
  }
}
