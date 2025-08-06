import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/utils/validators.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/core/widgets/custom_text_form_field.dart';
import 'package:selemara/features/auth/controller/auth_controller.dart';
import 'package:selemara/features/auth/widgets/user_type_drop_down.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // String? selectedUserType;
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final AuthController authController = Get.find<AuthController>();
    final res = AppResponsive();
    return Scaffold(
      body: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: res.hp(30)),
                AppText(
                  'create_account'.tr,
                  color: AppColors.textColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                // SizedBox(height: res.hp(8)),
                AppText(
                  'join_text'.tr,
                  color: AppColors.textColor.withValues(alpha: 0.8),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
                SizedBox(height: res.hp(40)),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserTypeDropdown(
                        value: authController.selectedUserType.value,
                        onChanged: (val) {
                          authController.selectedUserType.value = val!;
                          // setState(() {
                          //   selectedUserType = val;
                          // });
                        },
                      ),
                      SizedBox(height: res.hp(10)),
                      AppText(
                        'full_name'.tr,
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: res.hp(8)),
                      CustomTextFormField(
                        hintText: 'enter_name'.tr,
                        validator: Validators.required,
                        prefixIcon: AppImages.userIcon,
                      ),
                      SizedBox(height: res.hp(10)),
                      AppText(
                        'email'.tr,
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: res.hp(8)),
                      CustomTextFormField(
                        hintText: 'enter_email'.tr,
                        validator: Validators.required,
                        prefixIcon: AppImages.emailIcon,
                      ),

                      SizedBox(height: res.hp(10)),
                      AppText(
                        'phone_number'.tr,
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: res.hp(8)),
                      CustomTextFormField(
                        hintText: 'enter_phone'.tr,
                        validator: Validators.required,
                        prefixIcon: AppImages.phoneIcon,
                      ),

                      SizedBox(height: res.hp(10)),
                      AppText(
                        'password'.tr,
                        color: AppColors.textColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: res.hp(8)),
                      CustomTextFormField(
                        hintText: 'password_hint'.tr,
                        isPassword: true,
                        validator: Validators.password,
                        prefixIcon: AppImages.lockIcon,
                      ),
                      // SizedBox(height: res.hp(5)),
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
                        prefixIcon: AppImages.lockIcon,
                      ),
                      SizedBox(height: res.hp(5)),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(
                                () => Checkbox(
                                  side: BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                  activeColor: AppColors.primaryColor,
                                  checkColor: AppColors.primaryColor,
                                  fillColor: WidgetStateProperty.all<Color>(
                                    Colors.white,
                                  ),
                                  value: authController.agree.value,
                                  onChanged: (value) {
                                    authController.toggleAgree();
                                  },
                                ),
                              ),

                              RichText(
                                text: TextSpan(
                                  text: 'agree_prefix'.tr,
                                  style: GoogleFonts.inter(
                                    color: AppColors.graphite,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: 'terms_of_service'.tr,
                                      style: GoogleFonts.inter(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    TextSpan(text: 'and'.tr),
                                    TextSpan(
                                      text: "\n${'privacy_policy'.tr}",
                                      style: GoogleFonts.inter(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // AppText(
                              //   "Remember me",
                              //   color: AppColors.graphite,
                              //   fontSize: 14,
                              //   fontWeight: FontWeight.w400,
                              // ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: res.hp(30)),
                      CustomButton(
                        text: 'register_account'.tr,
                        onTap: () {
                          Get.offAllNamed(AppRoutes.garageNavScreen);
                          // if (formKey.currentState!.validate()) {}
                        },
                      ),
                      SizedBox(height: res.hp(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            'already_have_account'.tr,
                            color: AppColors.slateGray,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.login);
                            },
                            child: AppText(
                              'login'.tr,
                              color: AppColors.primaryColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
