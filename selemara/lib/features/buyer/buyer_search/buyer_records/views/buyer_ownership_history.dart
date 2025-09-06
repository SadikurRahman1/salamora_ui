import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';

import '../widgets/owner_card_widget.dart';
import 'buyer_ownership_details.dart';


class BuyerOwnershipHistory extends StatelessWidget {
  BuyerOwnershipHistory({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'ownership_history'.tr,
        leading: SizedBox(
          height: res.hp(10),
          width: res.wp(10),
          child: Image.asset(
            AppImages.beckButton,
            height: res.hp(10),
            width: res.wp(10),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                SizedBox(height: res.hp(12)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppIcons.multipleUser,
                            color: Colors.blue, width: 16),
                        SizedBox(width: res.wp(12)),
                        AppText(
                          "ownership_history".tr,
                          color: AppColors.textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Container(
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AppText(
                        "3 ${'owners'.tr}",
                        color: AppColors.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(12)),

                Column(
                  children: [
                    OwnerCard(
                      name: "john_smith",
                      date: "12/12/2025",
                      miles: "miles_sample",
                      status: "current_owner".tr,
                      isCurrent: true,
                      ontap: () {
                        Get.to(() => BuyerOwnershipDetails());
                      },
                    ),
                    OwnerCard(
                      name: "john smith",
                      date: "12/12/2025",
                      miles: "miles_sample",
                      status: "first_owner".tr,
                    ), OwnerCard(
                      name: "john_smith",
                      date: "12/12/2025",
                      miles: "miles_sample",
                      status: "first_owner".tr,
                    ),

                  ],
                )
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
