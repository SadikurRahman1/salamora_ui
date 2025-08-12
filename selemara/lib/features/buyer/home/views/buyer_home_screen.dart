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
import '../widgets/recent_activity_card_widget.dart';

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
              title: HomeHeader(
                name: "John Doe",
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
                            print("Card tapped");
                          },
                        );
                      },
                    ),

                  SizedBox(height: res.hp(16)),
                  AppText(
                      "Recent Activity",
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),

                 SizedBox(height: res.hp(10)),
                  RecentActiveCard(
                    imagePath: "assets/images/qr_code_red.png",
                    title: "Scanned Toyota Camry 2020",
                    subtitle: "4 Service History Verified",
                    borderRadius: 5,
                    onTap: () {},
                  ),
                  SizedBox(height: res.hp(10)),
                  RecentActiveCard(
                    imagePath: "assets/images/save.png",
                    title: "Saved Honda Accord 2019",
                    subtitle: "Added to your saved card",
                    borderRadius: 5,
                    onTap: () {},
                  ),
                 SizedBox(height: res.hp(16)),
                ]),
              ),
            ),
          ],
        ),
      );
  }
}
