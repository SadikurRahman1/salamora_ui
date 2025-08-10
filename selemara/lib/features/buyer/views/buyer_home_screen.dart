import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_icons.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/app_text.dart';
import '../widgets/buyer_banner.dart';
import '../widgets/featured_card_widget.dart';
import '../widgets/recent_activity_card_widget.dart';

class BuyerHomeScreen extends StatelessWidget {
  BuyerHomeScreen({super.key});

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
                            fontWeight: FontWeight.w600,
                          ),
                          AppText(
                            "Buyer",
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
            SliverToBoxAdapter(child: BuyerBanner(res: res)),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Featured Cars",
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

            FeaturedCard(
              res: res,
              imagePath: "assets/images/car_1.png",
              title: "2020 Toyota Camry",
              mileage: "45,230km",
              date: "1/15/2024",
              vin: "IHGBH41JXMN109186",
              price: "\$665",
              sideIconPath: "assets/icons/model.png",
              imageBorderRadius: 5,
              onTap: () {
                print("Card tapped");
              },
            ),
            FeaturedCard(
              res: res,
              imagePath: "assets/images/car_1.png",
              title: "2020 Toyota Camry",
              mileage: "45,230km",
              date: "1/15/2024",
              vin: "IHGBH41JXMN109186",
              price: "\$665",
              sideIconPath: "assets/icons/model.png",
              imageBorderRadius: 5,
              onTap: () {
                print("Card tapped");
              },
            ),
            FeaturedCard(
              res: res,
              imagePath: "assets/images/car_1.png",
              title: "2020 Toyota Camry",
              mileage: "45,230km",
              date: "1/15/2024",
              vin: "IHGBH41JXMN109186",
              price: "\$665",
              sideIconPath: "assets/icons/model.png",
              imageBorderRadius: 5,
              onTap: () {
                print("Card tapped");
              },
            ),


            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: AppText(
                "Recent Activity",
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(10))),
            RecentActiveCard(
              res: res,
              imagePath: "assets/images/qr_code_red.png",
              title: "Scanned Toyota Camry 2020",
              subtitle: "4 Service History Verified",
              borderRadius: 5,
              onTap: () {
                print("Card tapped");
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(10))),

            RecentActiveCard(
              res: res,
              imagePath: "assets/images/save.png",
              title: "Saved Honda Accord 2019",
              subtitle: "Added to your saved card",
              borderRadius: 5,
              onTap: () {
                print("Card tapped");
              },
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
          ],
        ),
      ),
    );
  }
}
