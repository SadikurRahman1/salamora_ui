import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/home_header.dart';
import '../controller/home_controller_owner.dart';
import '../widget/car_info_card.dart';
import '../widget/car_owner_banner_card.dart';
import '../widget/car_owner_feature_card.dart';
import '../widget/profile_card.dart';

class HomeScreenOwner extends StatelessWidget {
  HomeScreenOwner({super.key});

  final HomeControllerOwner controller = Get.find();

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        var data = controller.profileResponse.value;

        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: res.wp(0)),
              child:
                  controller.profileResponse.value != null
                      ? Center(child: CircularProgressIndicator())
                      : CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            pinned: true,
                            backgroundColor: Colors.white,
                            surfaceTintColor: Colors.transparent,
                            // disable Material tint
                            forceElevated: true,
                            elevation: 0,
                            automaticallyImplyLeading: false,
                            toolbarHeight: res.hp(50),
                            title: HomeHeader(
                              name: data?.name ?? "John Doe",
                              type: "Car Owner",
                              imagePath: AppImages.userProfile,
                              notificationIconPath:
                                  AppIcons.notificationIconImage,
                              imageSize: res.wp(40),
                              iconSize: res.wp(30),
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(30)),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: res.wp(16),
                              ),

                              child: CarOwnerBannerCard(res: res),
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(20)),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CarOwnerFeatureCard(
                                  count: "2",
                                  res: res,
                                  sideColor: AppColors.primaryColor1,
                                  cardText: "my_vehicles".tr,

                                  icon: AppIcons.carIcon2,
                                ),

                                CarOwnerFeatureCard(
                                  count: "23",
                                  res: res,
                                  sideColor: AppColors.primaryColor1,
                                  icon: AppIcons.check1,
                                  cardText: "service_records".tr,
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(16)),
                          ),
                          SliverToBoxAdapter(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CarOwnerFeatureCard(
                                  count: "5",
                                  res: res,
                                  sideColor: AppColors.primaryColor1,
                                  cardText: "alerts".tr,
                                  icon: AppIcons.notificationHome,
                                ),
                                CarOwnerFeatureCard(
                                  count: "3",
                                  res: res,
                                  sideColor: AppColors.primaryColor1,
                                  cardText: "due_soon".tr,
                                  icon: AppIcons.dueSoon,
                                ),
                              ],
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(32)),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: res.wp(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(20)),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.only(left: res.wp(16)),
                              child: SizedBox(
                                height: res.hp(200),
                                child: Obx(() {
                                  var dataList =
                                      controller.allCarList.value?.data;
                                  log(
                                    ".....................${dataList?[0].images[0]}",
                                  );

                                  return ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    // itemCount: dataList?.length,
                                    itemCount: 5,
                                    itemBuilder:
                                        (context, index) => Padding(
                                          padding: EdgeInsets.only(
                                            right: res.wp(16),
                                          ),
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                AppRoutes.carDetailsScreen,
                                                arguments: {"index": index},
                                              );
                                            },
                                            child: CarInfoCard(
                                              title:
                                                  dataList?[index].name ??
                                                  "2018 Honda Civic",
                                              subTitle:
                                                  dataList?[index].vin ??
                                                  "VIN: IHGCV2F6JLOOOOOO",
                                              carImage: AppIcons.carOwner,
                                              isCheck: true,
                                            ),
                                          ),
                                        ),
                                  );
                                }),
                              ),
                            ),
                          ),

                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: res.wp(16),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                          ),
                          SliverToBoxAdapter(
                            child: SizedBox(height: res.hp(0)),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: res.wp(16),
                              ),
                              child: Obx(() {
                                // var serviceData =
                                //     controller.allServicesList.value?.data;
                                // return serviceData == null ||
                                //         serviceData.isEmpty
                                //     ? const SizedBox(
                                //       width: 30,
                                //       height: 30,
                                //       child: CircularProgressIndicator(
                                //         strokeWidth: 3,
                                //       ),
                                //     )
                                //     :

                                var service =
                                    controller.allServicesList.value?.data;
                                var serviceData = [
                                  'ACCEPTED',
                                  'DECLINED',
                                  'pending',
                                ];

                                return ListView.builder(
                                  itemCount: serviceData.length,
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: 16),
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 12,
                                      ),
                                      child: ProfileCard(
                                        title: "service_user_name".tr,
                                        subTitle: "service_subtitle".tr,
                                        textStatus:
                                            serviceData[index] == "ACCEPTED"
                                                ? "completed".tr
                                                : serviceData[index] ==
                                                    "DECLINED"
                                                ? "declined".tr
                                                : "pending".tr,

                                        textColor:
                                            serviceData[index] == "ACCEPTED"
                                                ? AppColors.greenColor
                                                : serviceData[index] ==
                                                    "DECLINED"
                                                ? AppColors.red
                                                : null,

                                        boxColor:
                                            serviceData[index] == "ACCEPTED"
                                                ? AppColors.greenLight
                                                : serviceData[index] ==
                                                    "DECLINED"
                                                ? AppColors.redLight
                                                : null,
                                      ),
                                    );
                                  },
                                );
                              }),
                            ),
                          ),
                        ],
                      ),
            ),

            // ProfileCard(
            //   title: "service_user_name".tr,
            //   subTitle: "service_subtitle".tr,
            //   textStatus:
            //   serviceData[index]
            //       .garageSideStatus ==
            //       "ACCEPTED"
            //       ? "completed".tr
            //       : serviceData[index]
            //       .garageSideStatus ==
            //       "DECLINED"
            //       ? "declined".tr
            //       : "pending".tr,
            //
            //   textColor:
            //   serviceData[index]
            //       .garageSideStatus ==
            //       "ACCEPTED"
            //       ? AppColors.greenColor
            //       : serviceData[index]
            //       .garageSideStatus ==
            //       "DECLINED"
            //       ? AppColors.red
            //       : null,
            //
            //   boxColor:
            //   serviceData[index]
            //       .garageSideStatus ==
            //       "ACCEPTED"
            //       ? AppColors.greenLight
            //       : serviceData[index]
            //       .garageSideStatus ==
            //       "DECLINED"
            //       ? AppColors.redLight
            //       : null,
            // )
            Positioned(
              bottom: res.hp(20),
              right: res.wp(16),

              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.addVehicleScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 25),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor1,

                    borderRadius: BorderRadius.circular(24),
                  ),

                  child: Row(
                    children: [
                      Icon(Icons.add, color: AppColors.whitColor),
                      SizedBox(width: res.wp(4)),
                      AppText(
                        "Add Vehicle ",
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
