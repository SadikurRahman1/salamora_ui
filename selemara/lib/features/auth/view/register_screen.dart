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

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              SizedBox(height: res.hp(80)),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "Full Name",
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(height: res.hp(8)),
                    CustomTextFormField(
                      hintText: "Enter your full name",
                      validator: Validators.email,
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
                              fillColor:  WidgetStateProperty.all<Color>(Colors.white),
                              // focusColor:AppColors.primaryColor ,
                              // overlayColor: MaterialStateProperty.all(AppColors.primaryColor),
                              value: false,
                              onChanged: (value) {},
                            ),
                            
                            RichText(text:TextSpan(text: "I agree to the") )
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
                    SizedBox(height: res.hp(80)),
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
                            "Sign In",
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
