

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../widget/profile_header.dart';
import '../controller/garage_edit_profile_controller.dart';
import '../widgets/buyer_custom_text_field.dart';


class ProfileEditScreen extends StatelessWidget {
  ProfileEditScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final controller = Get.put(GarageEditProfileController());

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: 'my_profile'.tr,
        centerTitle: true,
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
                      ProfileHeader(
                        image: AppImages.manIcon,
                        name: "ElitePolish Auto Care",
                        location: "3885 Al Bandanna Street",
                        onEdit: () {
                        },
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
