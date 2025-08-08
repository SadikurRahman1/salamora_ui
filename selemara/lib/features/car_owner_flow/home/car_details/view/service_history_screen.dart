import 'package:flutter/material.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../widget/service_card.dart';
import 'package:get/get.dart';

class ServiceHistoryScreen extends StatelessWidget {
  ServiceHistoryScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Service History",
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

                SliverToBoxAdapter(
                  child: AppText(
                    "2020 Honda Civic Service History",
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor2A2A,
                    fontSize: 20,
                  ),
                ),

                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // important
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: res.hp(16)),
                        child: ServiceCard(
                          color: (index % 2 == 0) ? false : true,
                          title: "Oil Change & Fitter",
                          date: "6/15/2025",
                          serviceCenter: "Al Futtaim Service Center",
                          companyName: "Honda UAE",
                          invoiceLabel: "Invoice",
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            right: 30,
            child: SizedBox(
              width: res.wp(142),
              child: CustomButton(
                textIconWidth: 4,
                text: "Request Service",
                onTap: () {
                  Get.toNamed(AppRoutes.addVehicleScreen);
                },
                fontSize: 12,
                iconWidth: 16,
                iconHeight: 16,
                iconPath: AppIcons.plus1,
                iconColor: AppColors.whitColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
