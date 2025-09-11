import 'dart:math';

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
import '../../../buyer/buyer_profile/controller/buyer_profile_controller.dart';
import '../../dealer_cars/car_details/views/dealer_car_details_screen.dart';
import '../../dealer_cars/controller/dealer_car_controller.dart';
import '../../dealer_cars/views/dealer_car_search_screen.dart';
import '../../dealer_nav_bar/controller/dealer_nav_bar_controller.dart';
import '../controller/dealer_home_vehicle.dart';
import '../widgets/dealer_my_cars_card.dart';
import '../widgets/dealer_banner.dart';
import '../widgets/dealer_feature_card.dart';
import '../../common/widgets/recent_sales_widget.dart';

class DealerHomeScreen extends StatelessWidget {
  DealerHomeScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<BuyerProfileController>();
    final dealerHomeVehicleController = Get.find<DealerHomeVehicleController>();
    final dealerCarController = Get.find<DealerCarController>();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Colors.white,
            elevation: 0,
            automaticallyImplyLeading: false,
            toolbarHeight: res.hp(50),
            title: Obx(
              () => HomeHeader(
                name: controller.userData.value?.name ?? "",
                type: "dealership".tr,
                imagePath: AppImages.userProfile,
                notificationIconPath: AppIcons.notificationIconImage,
                imageSize: res.wp(40),
                iconSize: res.wp(30),
              ),
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
                    ).onTap((){
                      final navController = Get.find<DealerNavBarController>();
                      navController.changeIndex(1);
                    }),
                  ],
                ),
                SizedBox(height: res.hp(20)),

                _horizontalCarSection(dealerCarController),

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
                    // AppText(
                    //   "view_all".tr,
                    //   color: AppColors.primaryColor,
                    //   fontSize: 12,
                    //   fontWeight: FontWeight.w600,
                    // ),
                  ],
                ),
                // SizedBox(height: res.hp(10)),

                _recentSalesVehicle(dealerHomeVehicleController, dealerCarController),
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
              sideColor: AppColors.primaryColor1,
              cardText: "Total Inventory".tr,
              icon: AppIcons.carIcon2,
              number: '9',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor1,
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
              sideColor: AppColors.primaryColor1,
              cardText: "Revenue".tr,
              icon: AppIcons.notificationHome,
              number: '\$455',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor1,
              cardText: "Available Car".tr,
              icon: AppIcons.dueSoon,
              number: '3',
            ),
          ],
        ),
      ],
    );
  }

  Widget _horizontalCarSection(DealerCarController controller) {
    return SizedBox(
      height: 200,
      child: Obx(() {
        if (controller.isLoading.value) {
          return buildShimmerBox();
        }

        if (controller.dealerVehicles.isEmpty) {
          return const Center(child: Text("No cars found"));
        }

        return ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: min(controller.dealerVehicles.length, 5),
          itemBuilder: (context, index) {
            final vehicle = controller.dealerVehicles[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: DealerMyCarsCard(
                title: "${vehicle.year ?? ''} ${vehicle.name ?? 'Unknown Car'}",
                subTitle: vehicle.vin ?? '',
                carImagePath:
                    (vehicle.images != null && vehicle.images!.isNotEmpty)
                        ? vehicle.images!.first
                        : "https://via.placeholder.com/150",
                isVerified: vehicle.isVerified==false,
                onTap: () {
                  if (vehicle.id != null) {
                    controller.fetchSingleVehicle(vehicle.id!);
                    Get.to(() => DealerCarDetailsScreen());
                  } else {
                    Get.snackbar("Error", "Owner ID not found");
                  }
                },
              ),
            );
          },
        );
      }),
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
            btnColor: AppColors.primaryColor1,
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
            btnColor: AppColors.primaryColor1.withAlpha(40),
            onTap: () {
              Get.toNamed(AppRoutes.dealerRequestServiceScreen);
            },
          ),
        ),
      ],
    );
  }

  Widget _recentSalesVehicle(DealerHomeVehicleController controller, DealerCarController dealerCarController) {
    return SizedBox(
      child: Obx(() {
        if (controller.isLoading.value) {
          return Column(
            children: [
              buildShimmerBox(),
              SizedBox(height: res.hp(20)),
              buildShimmerBox(),
              SizedBox(height: res.hp(20)),
              buildShimmerBox(),
              SizedBox(height: res.hp(20)),

            ],
          );
        }

        if (controller.recentVehicles.isEmpty) {
          return const Center(child: Text("No cars found"));
        }

        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: min(controller.recentVehicles.length, 5),
          itemBuilder: (context, index) {
            final vehicle = controller.recentVehicles[index];
            return RecentSales(
              imagePath:
              (vehicle.images != null && vehicle.images!.isNotEmpty)
                  ? vehicle.images!.first
                  : AppImages.carImage,
              title: vehicle.name ?? 'Unknown Car',
              name:  vehicle.buyer?.name ?? 'Unknown Buyer',
              date: vehicle.sellAt != null
                  ? vehicle.sellAt!.toString().split(" ").first
                  : "-",
              imageBorderRadius: 8,
              onTap: () {
                if (vehicle.id != null) {
                  dealerCarController.fetchSingleVehicle(vehicle.id!);
                  Get.to(() => DealerCarDetailsScreen());
                } else {
                  Get.snackbar("Error", "Owner ID not found");
                }
              },
            );
          },
        );
      }),
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
