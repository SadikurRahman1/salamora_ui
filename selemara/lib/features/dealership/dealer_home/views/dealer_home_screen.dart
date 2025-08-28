import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/home_header.dart';
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
            title: HomeHeader(
              name: "Sadikur Rahman",
              type: "Dealership".tr,
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

                _fitureCardSection(),

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
                    ),
                  ],
                ),
                SizedBox(height: res.hp(20)),

                _horizontalCarSection(),

                SizedBox(height: res.hp(30)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "resent_sales".tr,
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

                ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RecentSales(
                      imagePath: AppImages.carImage,
                      title: "2020 Toyota Camry",
                      name: "Ahmed Al Mansouri",
                      date: "1/15/2024",
                      imageBorderRadius: 5,
                      onTap: () {
                        // Get.to(()=>BuyerCarDetailsScreen());
                      },
                    );
                  },
                ),

              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _horizontalCarSection() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(right: res.wp(16)),
              child: GestureDetector(
                onTap: () {},
                child: DealerMyCarsCard(
                  title: "2018 Honda Civic",
                  subTitle: "VIN: IHGCV2F6JLOOOOOO",
                  carImagePath: AppImages.carImage,
                ),
              ),
            ),
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

  Widget _fitureCardSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            DealerFeatureCard(
              sideColor: AppColors.primaryColor1,
              cardText: "my_vehicles".tr,
              icon: AppIcons.carIcon2,
              number: '12',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor1,
              cardText: "service_records".tr,
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
              cardText: "my_vehicles".tr,
              icon: AppIcons.notificationHome,
              number: '\$455',
            ),
            DealerFeatureCard(
              sideColor: AppColors.primaryColor1,
              cardText: "service_records".tr,
              icon: AppIcons.dueSoon,
              number: '3',
            ),
          ],
        ),
      ],
    );
  }
}
