import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/utils/validators.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/core/widgets/custom_text_form_field.dart';
import 'package:selemara/features/auth/controller/auth_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // SizedBox(height: res.hp(50)),
              AppText(
                "Welcome back",
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              // SizedBox(height: res.hp(8)),
              AppText(
                "Sign in to your account",
                color: AppColors.textColor.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              SizedBox(height: res.hp(80)),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Phone Number",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your phone",
                      validator: Validators.email,
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
                      hintText: "Password",
                      isPassword: true,
                      validator: Validators.password,
                    ),
                    SizedBox(height: res.hp(5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              side: BorderSide(color: AppColors.primaryColor),
                              activeColor: AppColors.primaryColor,
                              // focusColor:AppColors.primaryColor ,
                              // overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
                              value: false,
                              onChanged: (value) {},
                            ),
                            AppText(
                              "Remember me",
                              color: AppColors.graphite,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.profile);
                          },
                          child: AppText(
                            "Forgot password",
                            color: AppColors.primaryColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: res.hp(80)),
                    CustomButton(text: "Log In", onTap: () {}),
                    SizedBox(height: res.hp(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          "Don't have an Account?",
                          color: AppColors.slateGray,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        AppText(
                          "Sign Up",
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
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
