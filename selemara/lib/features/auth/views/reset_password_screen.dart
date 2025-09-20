import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/utils/validators.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/core/widgets/custom_text_form_field.dart';
import 'package:selemara/features/auth/controller/auth_controller.dart';

import '../../../core/routes/app_routes.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String phoneNumber;
  const ResetPasswordScreen({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final AuthController authController = Get.find<AuthController>();
    final res = AppResponsive();
    return Scaffold(
      body: BackgroundGradient(
        isOnBoarding: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: res.hp(70)),
              AppText(
                'reset_password'.tr,
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              // SizedBox(height: res.hp(8)),
              AppText(
                'password_requirement'.tr,
                textAlign: TextAlign.center,
                color: AppColors.textColor.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: res.hp(50)),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'password'.tr,
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: 'password_hint'.tr,
                      validator: Validators.password,
                      controller: authController.passwordTEController,
                    ),

                    SizedBox(height: res.hp(10)),
                    AppText(
                      'confirm_password'.tr,
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: 'enter_confirm_password'.tr,
                      isPassword: true,
                      validator: Validators.password,
                      controller: authController.confirmPTEController,
                    ),
                    SizedBox(height: res.hp(5)),

                    SizedBox(height: res.hp(80)),
                    CustomButton(
                      text: 'submit'.tr,
                      onTap: ()  {
                          Get.toNamed(AppRoutes.login);
                      },
                    ),
                    SizedBox(height: res.hp(20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
