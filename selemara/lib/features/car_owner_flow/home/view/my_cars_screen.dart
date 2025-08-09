import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widget/car_detail_card.dart';

class MyCarsScreen extends StatelessWidget {
  MyCarsScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cars",
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  AppText(
                    "My All Cars",
                    color: AppColors.textColor2B2B,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(
                    width: res.wp(128),

                    child: CustomButton(
                      text: "Add Vehicle ",
                      iconHeight: 16,
                      iconWidth: 16,
                      onTap: () {
                        Get.toNamed(AppRoutes.addVehicleScreen);
                      },

                      iconPath: AppIcons.plus1,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(), // important
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: res.hp(16)),
                    child: CarDetailCard(
                      imagePath: AppImages.carImage,
                      carName: "2020 Honda Civic",
                      colorName: "Silver",
                      mileage: "45,000 miles",
                      vin: "CV2F6JLOOOOOO",
                      lastService: "1/15/2024",
                      nextService: "4/15/2024",
                      serviceRecords: "8",
                      documents: "2 uploaded",
                      onIconTap: () {},
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(AppImages.carImage, fit: BoxFit.cover),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            // Your slivers go here
          ],
        ),
      ),
    );
  }
}
