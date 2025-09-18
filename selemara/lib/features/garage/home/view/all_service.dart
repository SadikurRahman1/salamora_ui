import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import '../widget/recent_service_card.dart';


class AllService extends StatelessWidget {
  AllService({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "all_service".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: ListView.separated(
        itemCount: 15,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemBuilder: (BuildContext context, int index) {
          return RecentServiceCard(
            titleText: "Oil Change",
            subTitleText: "Toyota Camry - Al Futtaim Service",
            currentStatus: 'Pending',
            onTap: (){},
          );
        },

        separatorBuilder: (__, ___) => SizedBox(height: res.hp(10)),
      )
    );
  }
}
