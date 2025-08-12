import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/home_header.dart';
import '../../../garage/home/widget/banner_card.dart';
import '../../../garage/home/widget/garage_feature_card.dart';
import '../controller/home_controller_owner.dart';
import '../widget/car_info_card.dart';
import '../widget/profile_card.dart';

class HomeScreenOwner extends StatelessWidget {
  HomeScreenOwner({super.key});

  final HomeControllerOwner controller = Get.find();

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
        child: CustomScrollView(
          slivers: [

            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: res.hp(50),
              title: HomeHeader(
                name: "John Doe",
                type: "Garage",
                imagePath: AppImages.userProfile,
                notificationIconPath: AppIcons.notificationIconImage,
                imageSize: res.wp(40),
                iconSize: res.wp(30),
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
                    cardText: "my_vehicles".tr,
                  ),
                  GarageFeatureCard(
                    res: res,
                    sideColor: AppColors.greenColor,
                    icon: AppIcons.check1,
                    cardText: "service_records".tr,
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
                    cardText: "alerts".tr,
                    icon: AppIcons.notificationHome,
                  ),
                  GarageFeatureCard(
                    res: res,
                    sideColor: AppColors.orange,
                    cardText: "due_soon".tr,
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
                    text: "add_vehicle".tr,
                    onTap: () {},
                  ),
                  CustomButton(
                    width: res.wp(160),
                    height: res.hp(60),
                    btnColor: AppColors.orange,
                    borderRadius: res.sp(30),
                    text: "request_service".tr,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "my_cars".tr,
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.myCarsScreen);
                    },
                    child: AppText(
                      "view_all".tr,
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
                          onTap: () {
                            Get.toNamed(AppRoutes.carDetailsScreen);
                          },
                          child: CarInfoCard(
                            title: "car_title".tr,
                            subTitle: "car_vin".tr,
                            carImage: AppImages.carImage,
                          ),
                        ),
                      ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "recent_service".tr,
                    color: AppColors.textColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  AppText(
                    "view_all".tr,
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
                      title: "service_user_name".tr,
                      subTitle: "service_subtitle".tr,
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
