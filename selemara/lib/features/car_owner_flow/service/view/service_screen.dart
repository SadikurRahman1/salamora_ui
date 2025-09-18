import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../home/controller/home_controller_owner.dart';
import '../../home/widget/profile_card.dart';

class ServiceScreen extends StatelessWidget {
  ServiceScreen({super.key});

  final res = AppResponsive();
  final HomeControllerOwner controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Services",
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
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

                var service = controller.allServicesList.value?.data;
                var serviceData = [
                  'ACCEPTED',
                  'pending',
                  'ACCEPTED',
                  'pending',
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
                      padding: const EdgeInsets.only(bottom: 15),
                      child: ProfileCard(
                        padding: 20,
                        title: "service_user_name".tr,
                        subTitle: "service_subtitle".tr,
                        textStatus:
                            serviceData[index] == "ACCEPTED"
                                ? "completed".tr
                                : serviceData[index] == "DECLINED"
                                ? "declined".tr
                                : "pending".tr,

                        textColor:
                            serviceData[index] == "ACCEPTED"
                                ? AppColors.greenColor
                                : serviceData[index] == "DECLINED"
                                ? AppColors.red
                                : null,

                        boxColor:
                            serviceData[index] == "ACCEPTED"
                                ? AppColors.greenLight
                                : serviceData[index] == "DECLINED"
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
    );
  }
}

//
