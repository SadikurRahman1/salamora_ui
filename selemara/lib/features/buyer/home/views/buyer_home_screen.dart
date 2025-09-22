import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import '../../../../core/widgets/home_header.dart';
import '../widgets/buyer_banner.dart';
import '../widgets/featured_card_widget.dart';
import '../../common/widgets/activity_card_widget.dart';
import '../../buyer_search/view/buyer_car_details_screen.dart';

class BuyerHomeScreen extends StatelessWidget {
  BuyerHomeScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:  CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              backgroundColor: Colors.white,
              elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: res.hp(50),
              title:HomeHeader(
                  name: "John Smith",
                  type: "buyer".tr,
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
                  BuyerBanner(),
                  SizedBox(height: res.hp(30)),
                  SizedBox(height: res.hp(20)),
                   Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "featured_cars".tr,
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
                      padding:EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 3,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return FeaturedCard(
                          imagePath: AppImages.carImage,
                          title: "2020 Toyota Camry",
                          mileage: "45,230km",
                          date: "1/15/2024",
                          vin: "IHGBH41JXMN109186",
                          price: "\$665",
                          sideIconPath: AppIcons.model,
                          imageBorderRadius: 5,
                          onTap: () {
                            Get.to(()=>BuyerCarDetailsScreen());
                          },
                        );
                      },
                    ),

                  SizedBox(height: res.hp(32)),
                  AppText(
                      "recent_activity".tr,
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),

                 // SizedBox(height: res.hp(20)),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: res.hp(12)),
                        child: ActiveCard(
                          imagePath: AppIcons.qrCodeRed,
                          title: "Scanned Toyota Camry 2020",
                          subtitle:  "Added to your saved card",
                        ),
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
}
