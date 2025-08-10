import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/home_header.dart';
import 'package:selemara/features/garage/home/widget/banner_card.dart';
import 'package:selemara/features/garage/home/widget/garage_feature_card.dart';

class GarageHomeScreen extends StatelessWidget {
  const GarageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

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
              name: "John Doe",
              type: "Garage",
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
                BannerCard(res: res),
                SizedBox(height: res.hp(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GarageFeatureCard(
                      res: res,
                      sideColor: AppColors.primaryColor,
                      cardText: "Total Services",
                    ),
                    GarageFeatureCard(
                      res: res,
                      sideColor: AppColors.greenColor,
                      cardText: "Customers",
                    ),
                  ],
                ),
                SizedBox(height: res.hp(20)),

                SizedBox(height: res.hp(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Service Request",
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      "View All",
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: res.hp(10)),
                _serviceRequestCard(res),
                SizedBox(height: res.hp(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "Recent Service",
                      color: AppColors.textColor,
                      fontSize: 18,
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
                SizedBox(height: res.hp(10)),
                _recentServiceCard(res),
                SizedBox(height: res.hp(16)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceRequestCard(AppResponsive res) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.hp(10),
        vertical: res.wp(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(res.sp(15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            child: ClipOval(
              child: Image.asset(
                "assets/icons/profile_home.png",
                width: res.wp(40),
                height: res.wp(40),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: res.wp(5)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                "Ahmed Al Mansouri",
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
              ),
              SizedBox(height: res.hp(5)),
              Row(
                children: [
                  AppText(
                    "Oil Change",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                  SizedBox(width: res.wp(5)),
                  Container(
                    width: res.wp(8),
                    height: res.wp(8),
                    decoration: BoxDecoration(
                      color: AppColors.textColor.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: res.wp(5)),
                  AppText(
                    "Date: 1/20/2024",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _recentServiceCard(AppResponsive res) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: res.hp(10),
        vertical: res.wp(10),
      ),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(res.sp(15)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withValues(alpha: 0.2),
            offset: Offset(0, 2),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                width: res.wp(8),
                height: res.wp(8),
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: res.wp(5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Ahmed Al Mansouri",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                  SizedBox(height: res.hp(5)),
                  AppText(
                    "Toyota Camry - Al Futtaim Service",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: AppColors.yallowColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(res.sp(20)),
            ),
            child: AppText(
              "Pending",
              color: AppColors.yallowColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
