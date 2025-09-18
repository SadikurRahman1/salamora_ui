import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import '../../../../core/routes/app_routes.dart';
import '../widget/service_request_card.dart';

class AllRequest extends StatelessWidget {
  AllRequest({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "all_request".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: ListView.separated(
        itemCount: 15,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
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
      )
    );
  }
}
