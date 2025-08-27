import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/routes/app_routes.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_button.dart';
import '../../common/widgets/dealer_history_card_widget.dart';
import '../widgets/car_image_card.dart';
import 'dealer_car_service_history_screen.dart';

class DealerCarDetailsScreen extends StatelessWidget {
  const DealerCarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: CarImageCard(
                imagePath: AppImages.carImage,
                title: "2018 Honda Civic",
                price: "\$20,000",
                miles: "15,420",
                services: "8",
                carColor: "Black",
                date: "2024-01-15",
                model: "IHGCV2F6JLOOOOOO",
                onContactTap: () {
                  print("Contact Seller tapped!");
                }, isPending: true,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'qr_ode'.tr,
                          textColor: AppColors.textColor,
                          iconPath: AppIcons.qrCode,
                          iconColor: AppColors.textColor,
                          btnColor: AppColors.primaryColor1.withAlpha(40),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: res.wp(20)),
                      Expanded(
                        child: CustomButton(
                          text: 'invoice'.tr,
                          textColor: AppColors.textColor,
                          iconPath: AppIcons.plus,
                          iconColor: AppColors.textColor,
                          btnColor: AppColors.primaryColor1.withAlpha(40),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: res.hp(16),),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'warranty'.tr,
                          textColor: AppColors.textColor,
                          iconPath: AppIcons.plus,
                          iconColor: AppColors.textColor,
                          btnColor: AppColors.primaryColor1.withAlpha(40),
                          onTap: () {},
                        ),
                      ),
                      SizedBox(width: res.wp(20)),
                      Expanded(
                        child: CustomButton(
                          text: 'service_history'.tr,
                          textColor: AppColors.textColor,
                          iconPath: AppIcons.plus,
                          iconColor: AppColors.textColor,
                          btnColor: AppColors.primaryColor1.withAlpha(40),
                          onTap: () {
                            // Get.to(()=>DealerCarServiceHistoryScreen);
                          },
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
    );
  }
}
