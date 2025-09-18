import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../controller/update_password_controller.dart';
import '../widget/custom_text_field.dart';

class UpdatePasswordScreen extends StatelessWidget {
  UpdatePasswordScreen({super.key});

  final controller = Get.put(UpdatePasswordController());

  @override
  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'password'.tr,
        leading: Image.asset(AppImages.beckButton),
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
                    SizedBox(height: res.hp(28)),

                    AppText(
                      "existing_password".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.oldController,
                      hintText: 'existing_password_hunt'.tr,
                    ),
                    SizedBox(height: res.hp(20)),

                    AppText(
                      "new_password".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.newController,
                      hintText: 'new_password'.tr,
                    ),
                    SizedBox(height: res.hp(20)),

                    AppText(
                      "confirm_password".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.confirmController,
                      hintText: "confirm_password".tr,
                    ),
                    SizedBox(height: res.hp(24)),

                    CustomButton(
                      text: "update_password".tr,
                      onTap: () {},
                      btnColor: Color(0xFF2E3A49),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
