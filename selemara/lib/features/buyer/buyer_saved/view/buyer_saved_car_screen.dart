import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../widgets/saved_car_widget.dart';

class BuyerSavedCarScreen extends StatelessWidget {
  const BuyerSavedCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Scaffold(
      appBar: CustomAppBar(
        title: "saved_cars".tr,
        centerTitle: true,
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "7 ${"saved_cars".tr}",
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    "clear_all".tr,
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child:ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SavedCarWidget(
                    imagePath: AppImages.carImage,
                    title: "2020 Toyota Camry",
                    mileage: "45,230km",
                    serviceCount: "8 Services",
                    price: "\$65265",
                    onContactTap: () {},
                  );
                },
              ),
            ),


            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
          ],
        ),
      ),
    );
  }
}
