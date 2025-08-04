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
    String? selectedUserType;
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final AuthController authController = Get.find<AuthController>();
    final res = AppResponsive();
    return Scaffold(
      body: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: res.hp(30)),
              AppText(
                "Create Your Account",
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              // SizedBox(height: res.hp(8)),
              AppText(
                "Join our community of vehicle enthusiasts",
                color: AppColors.textColor.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: res.hp(40)),
              Form(
                key: _formKey,
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
                      "Full Name",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your full name",
                      validator: Validators.required,
                      prefixIcon: AppImages.userIcon,
                    ),
                    SizedBox(height: res.hp(10)),
                    AppText(
                      "Email addresss",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your email address",
                      validator: Validators.required,
                      prefixIcon: AppImages.emailIcon,
                    ),

                    SizedBox(height: res.hp(10)),
                    AppText(
                      "Phone Number",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your phone number",
                      validator: Validators.required,
                      prefixIcon: AppImages.phoneIcon,
                    ),

                    SizedBox(height: res.hp(10)),
                    AppText(
                      "Password",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your password",
                      isPassword: true,
                      validator: Validators.password,
                      prefixIcon: AppImages.lockIcon,
                    ),
                    // SizedBox(height: res.hp(5)),
                    SizedBox(height: res.hp(10)),
                    AppText(
                      "Confirm Password",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your confirm password",
                      isPassword: true,
                      validator: Validators.password,
                      prefixIcon: AppImages.lockIcon,
                    ),
                    SizedBox(height: res.hp(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Obx(
                              () => Checkbox(
                                side: BorderSide(color: AppColors.primaryColor),
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
                                text: "I agree to the ",
                                style: GoogleFonts.inter(
                                  color: AppColors.graphite,
                                ),
                                children: [
                                  TextSpan(
                                    text: "Terms of Service ",
                                    style: GoogleFonts.inter(
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                  TextSpan(text: "and "),
                                  TextSpan(
                                    text: "\nPrivacy Policy",
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
                    SizedBox(height: res.hp(50)),
                    CustomButton(
                      text: "Create Account",
                      onTap: () {
                        authController.login();
                      },
                    ),
                    SizedBox(height: res.hp(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Already have an account?",
                          color: AppColors.slateGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: AppText(
                            "Log In",
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
    );
  }
}
