import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';

class BuyerSearchScreen extends StatelessWidget {
  BuyerSearchScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Search Cars",
        centerTitle: true,
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: SingleChildScrollView(
            child: Column(
                children: [
                  SizedBox(height: res.hp(0)),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          height: res.wp(64),
                          width: res.wp(64),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primaryColor.withValues(alpha: 0.1),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppIcons.qrCode,
                              height: res.hp(32),
                              width: res.wp(32),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        AppText(
                          "Scan Car QR Code",
                          fontSize: res.sp(16),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                        SizedBox(height: res.hp(8)),
                        AppText(
                          "Point your camera at the car's QR code to view its complete service history",
                          fontSize: res.sp(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor.withValues(alpha: 0.8),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: res.hp(20)),

                      ],
                    ),
                  ),
                  CustomButton(
                    text: "Scan Now",
                    btnColor: AppColors.orange,
                    borderRadius: 8,
                    onTap: () {},
                  ),
                  SizedBox(height: res.hp(12)),
                  AppText(
                    "OR",
                    fontSize: res.sp(16),
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(height: res.hp(12)),
                  CustomTextFormField(
                    // borderRadius: 8 ,
                    hintText: 'Enter VIN Manually',
                    // validator: Validators.email,
                  ),
                  SizedBox(height: res.hp(12)),
                  CustomButton(
                    text: "Search",iconPath: AppIcons.qrCode,

                    onTap: () {},
                  ),

                  AppText(
                    "Recent Activity",
                    textAlign: TextAlign.start,
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ]
            ),
        ),
      ),
    );
  }
}
