import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/home_header.dart';
import '../../dealer_cars/car_details/views/dealer_car_details_screen.dart';
import '../../dealer_nav_bar/controller/dealer_nav_bar_controller.dart';
import '../widgets/dealer_my_cars_card.dart';
import '../widgets/dealer_banner.dart';
import '../widgets/dealer_feature_card.dart';
import '../../common/widgets/recent_sales_widget.dart';

class DealerHomeScreen extends StatelessWidget {
  DealerHomeScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: res.hp(50),
            title:HomeHeader(
              name: "john ",
              type: "dealership".tr,
              imagePath: AppImages.userProfile,
              notificationIconPath: AppIcons.notificationIconImage,
              imageSize: res.wp(40),
              iconSize: res.wp(30),
            ),
          ),

          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: res.hp(30)),

                DealerBanner(),

                SizedBox(height: res.hp(30)),

                _featureCardSection(),

                SizedBox(height: res.hp(30)),

                _buttonSection(),

                SizedBox(height: res.hp(30)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "my_cars".tr,
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      "view_all".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ).onTap(() {
                      final navController = Get.find<DealerNavBarController>();
                      navController.changeIndex(1);
                    }),
                  ],
                ),
                SizedBox(height: res.hp(20)),

                _horizontalCarSection(),

                SizedBox(height: res.hp(30)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "recent_sales".tr,
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
                SizedBox(height: res.hp(10)),

                _recentSalesVehicle(),

                SizedBox(height: res.hp(30)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _featureCardSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DealerFeatureCard(
              sideColor: AppColors.primaryColor,
              cardText: "Total Inventory".tr,
              icon: AppIcons.carIcon2,
              number: '9',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor,
              cardText: "Monthly Sales".tr,
              icon: AppIcons.check1,
              number: '23',
            ),
          ],
        ),
        SizedBox(height: res.hp(16)),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DealerFeatureCard(
              sideColor: AppColors.primaryColor,
              cardText: "Revenue".tr,
              icon: AppIcons.notificationHome,
              number: '\$455',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor,
              cardText: "Available Car".tr,
              icon: AppIcons.dueSoon,
              number: '3',
            ),
          ],
        ),
      ],
    );
  }

  Widget _horizontalCarSection() {
    return SizedBox(
      height: 200,
      child:ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DealerMyCarsCard(
              title: "2021 Honda Accord",
              subTitle:'IHGCV2F6JLOOOOOO',
              carImagePath: AppImages.carImage,
              isVerified: false,
              onTap: () {
                Get.to(() => DealerCarDetailsScreen());
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buttonSection() {
    return Row(
      children: [
        Expanded(
          child: CustomButton(
            text: 'add_vehicle'.tr,
            iconPath: AppIcons.plus,
            iconColor: AppColors.whitColor,
            btnColor: AppColors.primaryColor,
            onTap: () {
              Get.toNamed(AppRoutes.dealerAddVehicleScreen);
            },
          ),
        ),
        SizedBox(width: res.wp(20)),
        Expanded(
          child: CustomButton(
            text: 'request_service'.tr,
            textColor: AppColors.textColor,
            btnColor: AppColors.primaryColor.withAlpha(40),
            onTap: () {
              Get.toNamed(AppRoutes.dealerRequestServiceScreen);
            },
          ),
        ),
      ],
    );
  }

  Widget _recentSalesVehicle() {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {

          return RecentSales(
            imagePath: AppImages.carImage,
            title: '2020 Toyota Camry',
            name: 'Ahmed Al Mansouri',
            date: "1/15/2024",
            imageBorderRadius: 8,
            onTap: () {
                Get.to(() => const DealerCarDetailsScreen());
            },
          );
        },
      ),
    );
  }

  Widget buildShimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
