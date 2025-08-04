import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    final res = AppResponsive();
    return Scaffold(
      body: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: res.hp(50)),
              AppText(
                "Welcome back",
                color: AppColors.textColor,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: res.hp(8)),
              AppText(
                "Sign in to your account",
                color: AppColors.textColor.withValues(alpha: 0.8),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              Column(
                children: [
                  CustomTextFormField(hintText: "Enter your email"),
                  SizedBox(height: res.hp(10),),
                  CustomTextFormField(hintText: "Password"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
