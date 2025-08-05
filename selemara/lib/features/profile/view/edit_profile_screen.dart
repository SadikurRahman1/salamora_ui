import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/features/profile/controller/edit_profile_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../core/widgets/custom_button.dart';
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
                      "gender".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),

                    SizedBox(height: res.hp(8)),

                    Obx(
                      () => DropdownButtonFormField<String>(
                        value:
                            controller.selectedOption.value.isEmpty
                                ? null
                                : controller.genders.contains(
                                  controller.selectedOption.value,
                                )
                                ? controller.selectedOption.value
                                : null,
                        hint: const Text('Select an option'),
                        items:
                            controller.genders.map((item) {
                              return DropdownMenuItem<String>(
                                value: item,
                                child: Text(item),
                              );
                            }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            controller.selectedOption.value = value;
                          }
                        },
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0D5DD),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: Color(0xFFD0D5DD),
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: res.hp(20)),

                    AppText(
                      "date_of_birth".tr,
                      color: AppColors.textColor2939,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                    SizedBox(height: res.hp(8)),

                    CustomTextField(
                      controller: controller.dateBirthController,
                      hintText: 'date_of_birth_hint'.tr,
                    ),
                  ],
                ),
              ),
            ),

            CustomButton(text: "update_password".tr, onTap: () {}),
            SizedBox(height: res.hp(24)),
          ],
        ),
      ),
    );
  }
}
