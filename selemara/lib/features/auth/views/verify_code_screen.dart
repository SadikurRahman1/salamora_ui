import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/features/auth/controller/auth_controller.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String phoneNumber;
  final bool isPasswordReset;
  const VerifyCodeScreen({
    super.key,
    required this.phoneNumber,
    this.isPasswordReset = false,
  });

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final AuthController authController = Get.find<AuthController>();
    final res = AppResponsive();
    final defaultPinTheme = PinTheme(
      width: res.wp(40),
      height: res.wp(40),
      textStyle: TextStyle(
        fontSize: 20,
        color: AppColors.textColor,
        fontWeight: FontWeight.w600,
      ),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        border: Border.all(color: AppColors.pinInputBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.pinInputBorderColor),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        borderRadius: BorderRadius.circular(8),
      ),
    );

    return Scaffold(
      body: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: res.hp(100)),
              AppText(
                'verify_code'.tr,
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              // SizedBox(height: res.hp(8)),
              AppText(
                'enter_sent_code'.tr,
                textAlign: TextAlign.center,
                color: AppColors.textColor.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    'phone_number'.tr,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  AppText(
                    phoneNumber,
                    color: AppColors.textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(height: res.hp(20)),
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: res.hp(8)),
                    Pinput(
                      length: 6,
                      controller: authController.otpTEController,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      defaultPinTheme: defaultPinTheme,
                      focusedPinTheme: focusedPinTheme,
                      submittedPinTheme: submittedPinTheme,
                      pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                      showCursor: true,
                      onCompleted: (pin) => debugPrint(pin),
                    ),

                    SizedBox(height: res.hp(10)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Resend code in ",
                          color: AppColors.lightGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        // SizedBox(width: res.hp(10)),
                        AppText(
                          "00:04",
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(height: res.hp(25)),
                    CustomButton(
                      text: 'submit'.tr,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          await authController.verifyPhone(
                            otp: authController.otpTEController.text,
                            isPasswordReset: isPasswordReset,
                          );
                        }
                        // Get.toNamed(AppRoutes.resetPassword);
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
