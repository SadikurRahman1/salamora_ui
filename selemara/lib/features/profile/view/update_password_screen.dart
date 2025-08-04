import 'package:flutter/material.dart';
import 'package:selemara/features/profile/controller/update_password_controller.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/app_text.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_button.dart';
import '../widget/custom_text_field.dart';
import 'package:get/get.dart';
class UpdatePasswordScreen extends StatelessWidget {
   UpdatePasswordScreen({super.key});
   final controller = Get.put(UpdatePasswordController());


   @override
   @override
   Widget build(BuildContext context) {
     final res = AppResponsive();

     return Scaffold(
       appBar: CustomAppBar(
         title: 'Password',
         leading: Image.asset(AppImages.beckButton),
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
                     SizedBox(height: res.hp(28)),

                     AppText(
                       "Existing Password",
                       color: AppColors.textColor2939,
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                     ),
                     SizedBox(height: res.hp(8)),

                     CustomTextField(
                       controller: controller.oldController,
                       hintText: 'Old password',
                     ),
                     SizedBox(height: res.hp(20)),

                     AppText(
                       "New Password",
                       color: AppColors.textColor2939,
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                     ),
                     SizedBox(height: res.hp(8)),

                     CustomTextField(
                       controller: controller.newController,
                       hintText: 'New password',
                     ),
                     SizedBox(height: res.hp(20)),

                     AppText(
                       "Confirm Password",
                       color: AppColors.textColor2939,
                       fontWeight: FontWeight.w500,
                       fontSize: 16,
                     ),
                     SizedBox(height: res.hp(8)),

                     CustomTextField(
                       controller: controller.confirmController,
                       hintText: 'Confirm password',
                     ),
                     SizedBox(height: res.hp(24)),



                     CustomButton(text: "Update Password", onTap: () {}),


                   ],
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }

}
