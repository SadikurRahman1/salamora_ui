import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/features/garage/home/widget/banner_card.dart';
import 'package:selemara/features/garage/home/widget/garage_feature_card.dart';

class GarageHomeScreen extends StatelessWidget {
  const GarageHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: res.hp(0)),
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
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "Service Request",
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
              child: Container(
                // width: res.wp(100),
                // height: res.hp(70),
                padding: EdgeInsets.symmetric(
                  horizontal: res.hp(10),
                  vertical: res.wp(10),
                ),
                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(res.sp(15)),
                    bottomLeft: Radius.circular(res.sp(15)),
                    topRight: Radius.circular(res.sp(15)),
                    bottomRight: Radius.circular(res.sp(15)),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          // mainAxisAlignment: MainAxisAlignment.start,
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
                                color: AppColors.textColor.withValues(
                                  alpha: 0.5,
                                ),
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
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
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
              child: Container(
                // width: res.wp(100),
                // height: res.hp(70),
                padding: EdgeInsets.symmetric(
                  horizontal: res.hp(10),
                  vertical: res.wp(10),
                ),
                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(res.sp(15)),
                    bottomLeft: Radius.circular(res.sp(15)),
                    topRight: Radius.circular(res.sp(15)),
                    bottomRight: Radius.circular(res.sp(15)),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryColor.withValues(alpha: 0.2),
                      offset: Offset(0, 2),
                      blurRadius: 4,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: Container(
                            width: res.wp(8),
                            height: res.wp(8),
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              shape: BoxShape.circle,
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

                    // SizedBox(width: res.hp(20)),
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
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
          ],
        ),
      ),
    );
  }
}
