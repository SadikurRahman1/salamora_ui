import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../garage/home/widget/banner_card.dart';
import '../../../garage/home/widget/garage_feature_card.dart';
import '../widget/car_info_card.dart';
import '../widget/profile_card.dart';

class HomeScreenOwner extends StatelessWidget {
  HomeScreenOwner({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(70))),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(AppImages.userProfile),
                      SizedBox(width: res.wp(5)),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            "John Doe",
                            color: AppColors.textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                          AppText(
                            "Garage",
                            color: AppColors.textColor.withValues(alpha: 0.8),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    AppIcons.notificationIconImage,
                    width: res.wp(30),
                    height: res.hp(30),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(30))),
            SliverToBoxAdapter(child: BannerCard(res: res)),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GarageFeatureCard(
                    res: res,

                    sideColor: AppColors.primaryColor,
                    cardText: "My Vehicles",
                  ),
                  GarageFeatureCard(
                    res: res,
                    sideColor: AppColors.greenColor,
                    icon: AppIcons.check1,
                    cardText: "Service Records",
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GarageFeatureCard(
                    res: res,
                    sideColor: AppColors.orange,
                    cardText: "Alerts",
                    icon: AppIcons.notificationHome,
                  ),
                  GarageFeatureCard(
                    res: res,
                    sideColor: AppColors.orange,
                    cardText: "Due Soon",
                    icon: AppIcons.dueSoon,
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    width: res.wp(160),
                    height: res.hp(60),
                    iconPath: AppIcons.plus,
                    borderRadius: res.sp(30),
                    text: "Add Vehicle",
                    onTap: () {},
                  ),
                  CustomButton(
                    width: res.wp(160),
                    height: res.hp(60),
                    btnColor: AppColors.orange,
                    borderRadius: res.sp(30),
                    text: "Request Service",
                    onTap: () {},
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "My Cars",
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.myCarsScreen);
                    },
                    child: AppText(
                      "View All",
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: SizedBox(
                height: res.hp(212),
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder:
                      (context, index) => Padding(
                        padding: EdgeInsets.only(right: res.wp(16)),
                        child: GestureDetector(
                          onTap: (){
                            Get.toNamed(AppRoutes.carDetailsScreen);


                          },
                          child: CarInfoCard(
                            title: "2018 Honda Civic2018",
                            subTitle: "VIN: IHGCV2F6JLOOOOOO",
                            carImage: AppImages.carImage,
                          ),
                        ),
                      ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Recent Service",
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    "View All",
                    color: AppColors.primaryColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(10))),

            SliverToBoxAdapter(
              child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProfileCard(
                      title: "'Ahmed Al Mansouri",

                      subTitle: "Toyota Camry - Al Futtaim Service",
                    ),
                  );
                },
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
          ],
        ),
      ),
    );
  }
}
