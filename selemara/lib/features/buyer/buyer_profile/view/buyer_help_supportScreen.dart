import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../common/widgets/buyer_get_image.dart';
import '../controller/buyer_help_support_controller.dart';
import '../widgets/buyer_custom_text_field.dart';


class BuyerHelpSupportscreen extends StatelessWidget {
  BuyerHelpSupportscreen({super.key});

  final res = AppResponsive();
  final controller = Get.put(BuyerHelpSupportController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'help_support'.tr,
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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(28))),

            SliverToBoxAdapter(
              child: AppText(
                "support_type".tr,
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: BuyerCustomTextField(
                controller: controller.supportTypeController,
                hintText: 'support_title_hint'.tr,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: AppText(
                "description".tr,
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: BuyerCustomTextField(
                maxLine: 5,
                minLine: 3,
                controller: controller.descriptionController,
                hintText: 'description_hint'.tr,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: AppText(
                "upload_image".tr,
                color: AppColors.textColor2939,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  GetImageFromGalleryCamera().chooseImage(context, (image) {
                    log("............$image............");
                    controller.file.value = File(image.path);
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(horizontal: 17, vertical: 39),
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFCCCCCC)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        AppIcons.upload,
                        height: res.hp(32),
                        width: res.wp(32),
                      ),
                      SizedBox(height: res.hp(16)),

                      AppText(
                        "upload_click_text".tr,
                        color: AppColors.secondryTextColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: res.hp(8)),

                      AppText(
                        "upload_format_text".tr,
                        color: AppColors.secondryTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),

            SliverToBoxAdapter(
              child: CustomButton(
                text: "submit".tr,
                onTap: () {},
              ),
            )
          ],
        ),
      ),
    );
  }

}
