import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/buyer_search_controller.dart';
import '../widgets/owner_card_widget.dart';
import 'buyer_ownership_details.dart';

class BuyerOwnershipHistory extends StatelessWidget {
  BuyerOwnershipHistory({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    BuyerSearchController controller = Get.put(
      BuyerSearchController(),
      permanent: true,
    );

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

                /// Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          AppIcons.multipleUser,
                          color: Colors.blue,
                          width: 16,
                        ),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
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

                /// Owner List
                Column(
                  children: [
                    OwnerCard(
                      name: "John Smith",
                      date: "1/15/2024",
                      miles: "45,000 miles",
                      status: "Current Owner".tr,
                      isCurrent: true,
                      ontap: () {
                        Get.to(() => BuyerOwnershipDetails());
                      },
                    ),

                    OwnerCard(
                      name: "John Smith",
                      date: "1/15/2024",
                      miles: "45,000 miles",
                      status: "first_owner".tr,
                      isCurrent: false,
                      ontap: () {
                        Get.to(() => BuyerOwnershipDetails());
                      },
                    ),
                    OwnerCard(
                      name: "John Smith",
                      date: "1/15/2024",
                      miles: "45,000 miles",
                      status: "first_owner".tr,
                      isCurrent: false,
                      ontap: () {
                        Get.to(() => BuyerOwnershipDetails());
                      },
                    ),
                    OwnerCard(
                      name: "John Smith",
                      date: "1/15/2024",
                      miles: "45,000 miles",
                      status: "first_owner".tr,
                      isCurrent: false,
                      ontap: () {
                        Get.to(() => BuyerOwnershipDetails());
                      },
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildShimmerList() {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            height: 90,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
