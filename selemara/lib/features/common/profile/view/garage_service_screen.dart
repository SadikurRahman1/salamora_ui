import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/common/profile/view/profile_edit_screen.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/constants/token_key.dart';
import '../../../../core/helper/shared_preferences_helper.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import 'package:get/get.dart';
import '../../widget/profile_header.dart';
import '../widgets/service_card.dart';

class GarageProfileSecondScreen extends StatelessWidget {
  GarageProfileSecondScreen({super.key});

  final res = AppResponsive();
  final SharedPreferencesHelper _preferencesHelper = SharedPreferencesHelper();

  @override
  Widget build(BuildContext context) {


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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: res.hp(0)),
              ProfileHeader(
                image: AppImages.manIcon,
                name: "ElitePolish Auto Care",
                location: "3885 Al Bandanna Street",
                onEdit: () {
                  Get.to(() => ProfileEditScreen());
                },
              ),


              SizedBox(height: res.hp(20)),

              AppText(
                "Service",
                fontSize: res.sp(20),
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
              ),

              SizedBox(height: res.hp(10)),

              ListView.separated(
                itemCount: 7,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return ServicePriceCard(
                    title: "Exterior Cleaning",
                    price: "AED${index + 1}",
                    onTap: () {},
                  );
                },
                separatorBuilder: (__, ___) => SizedBox(height: res.hp(10)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showBeautifulBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // Transparent to show rounded corners
      isScrollControlled: true,
      builder: (context) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, -3),
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                "logout".tr,
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),

              SizedBox(height: res.hp(20)),

              Container(
                height: 1,
                decoration: BoxDecoration(color: Color(0xFFf2f4f7)),
              ),
              SizedBox(height: res.hp(20)),
              AppText(
                "are_you_sure_you".tr,
                color: Color(0xFF344054),
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),

              SizedBox(height: res.hp(24)),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        text: "no".tr,
                        onTap: () {
                          Get.back();
                        },
                        btnColor: AppColors.backGroundColor,
                        borderColor: AppColors.primaryColor,
                        isBorder: true,
                        textColor: AppColors.primaryColor,
                        borderRadius: 8,
                      ),
                    ),

                    SizedBox(width: res.wp(16)),

                    Expanded(
                      child: CustomButton(
                        btnColor: AppColors.primaryColor,
                        text: "yes".tr,
                        onTap: () async {
                          await _preferencesHelper.remove(TokenKey.accessToken);
                          await _preferencesHelper.remove(TokenKey.userId);
                          await _preferencesHelper.remove(TokenKey.role);

                          Get.offAllNamed(AppRoutes.login);
                        },
                        borderRadius: 8,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: res.hp(20)),
            ],
          ),
        );
      },
    );
  }
}
