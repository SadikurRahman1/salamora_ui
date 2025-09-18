import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/features/garage/garage_services/widgets/service_card.dart';

import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../service_details/garage_service_controller.dart';
import '../service_details/view/service_details.dart';


class GarageServicesScreen extends StatelessWidget {
  GarageServicesScreen({super.key});

  final res = AppResponsive();
  final controller = Get.put(GarageServiceController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GarageServiceController>(
      builder: (ctrl) {
        return Scaffold(
          appBar: CustomAppBar(
            title: "service".tr,
            centerTitle: true,
            // leading: Icon(Icons.arrow_back, size: res.wp(24)),
            bottom: TabBar(
              controller: ctrl.tabController,
              indicatorColor: ctrl.getIndicatorColor(),
              tabs: [
                Tab(
                  child: Text(
                    "in_progress".tr,
                    style: TextStyle(
                      color: ctrl.getTabColor(0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "completed".tr,
                    style: TextStyle(
                      color: ctrl.getTabColor(1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: ctrl.tabController,
            children: [
              // InProgress Tab
              Padding(
                padding: EdgeInsets.all(res.wp(16)),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ServiceCard(
                      title: "Service #$index",
                      car: "202${index} Honda Civic",
                      user: "User $index",
                      price: "\$${100 + index * 50}",
                      imageUrl: AppImages.carImage,
                      onTap: () {
                        Get.to(() => ServiceDetails());
                      },
                    );
                  },
                ),
              ),

              // Completed Tab
              Padding(
                padding: EdgeInsets.all(res.wp(16)),
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return ServiceCard(
                      title: "Completed #$index",
                      car: "201${index} Toyota",
                      user: "Customer $index",
                      price: "\$${200 + index * 80}",
                      imageUrl: AppImages.carImage,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
