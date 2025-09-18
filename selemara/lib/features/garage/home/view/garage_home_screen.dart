import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/home_header.dart';
import 'package:selemara/features/garage/home/view/all_request.dart';
import 'package:selemara/features/garage/home/widget/banner_card.dart';
import 'package:selemara/features/garage/home/widget/garage_feature_card.dart';
import 'package:selemara/features/garage/home/widget/recent_service_card.dart';
import 'package:selemara/features/garage/home/widget/service_request_card.dart';
import 'all_service.dart';

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
              type: "garage".tr,
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
                      sideColor: AppColors.blueColor,
                      title: "Total Service".tr,
                      value: "5",
                      icon: AppIcons.car,
                      onTap: () {},
                    ),

                    GarageFeatureCard(
                      sideColor: AppColors.greenColor,
                      title: "Customer".tr,
                      value: "5",
                      icon: AppIcons.check1,
                      onTap: () {},
                    ),

                  ],
                ),
                SizedBox(height: res.hp(20)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "service_request".tr,
                      color: AppColors.textColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    AppText(
                      "view_all".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ).onTap(()=>Get.to(()=>AllRequest())),
                  ],
                ),
                SizedBox(height: res.hp(10)),
                _serviceRequest(res),
                SizedBox(height: res.hp(16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "recent_service".tr,
                      color: AppColors.textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                    AppText(
                      "view_all".tr,
                      color: AppColors.primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ).onTap(()=>Get.to(()=>AllService())),
                  ],
                ),
                SizedBox(height: res.hp(10)),
                _recentService(res),
                SizedBox(height: res.hp(16)),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _serviceRequest(AppResponsive res) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return ServiceRequestCard(
          name: "Ahmed Al Mansouri",
          service: "Oil Change",
          date: "1/20/2024",
          imagePath: "assets/icons/profile_home.png",
          onTap: () {
            Get.toNamed(AppRoutes.serviceRequest);
          },
        );
      },

      separatorBuilder: (__, ___) => SizedBox(height: res.hp(10)),
    );
  }

  Widget _recentService(AppResponsive res) {
    return ListView.separated(
      itemCount: 4,
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return RecentServiceCard(
          titleText: "Oil Change",
          subTitleText: "Toyota Camry - Al Futtaim Service",
          currentStatus: 'Pending',
          onTap: (){},
        );
      },
      separatorBuilder: (__, ___) => SizedBox(height: res.hp(10)),
    );
  }
}
