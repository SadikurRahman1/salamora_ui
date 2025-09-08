import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import '../../controller/buyer_search_controller.dart';
import '../widgets/owner_card_widget.dart';
import 'buyer_ownership_details.dart';

class BuyerOwnershipHistory extends StatelessWidget {
  BuyerOwnershipHistory({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    BuyerSearchController controller = Get.put(BuyerSearchController(), permanent: true);

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
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.ownerHistoryList.isEmpty) {
          return Center(
            child: AppText(
              "No ownership history found",
              color: AppColors.textColor,
              fontSize: 14,
            ),
          );
        }

        return CustomScrollView(
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
                        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: AppText(
                          "${controller.ownerHistoryList.length} ${'owners'.tr}",
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
                    children: controller.ownerHistoryList.map((owner) {
                      return OwnerCard(
                        name: owner.owner?.name ?? "Unknown",
                        date: owner.createdAt != null
                            ? owner.createdAt!.toLocal().toString().split(' ')[0]
                            : "N/A",
                        miles: "${owner.currentMileage ?? 0} miles",
                        status: owner.isCurrentOwner == true ? "current_owner".tr : "first_owner".tr,
                        isCurrent: owner.isCurrentOwner == true ? true : false,
                        ontap: () {
                          // Get.to(() => BuyerOwnershipDetails());
                          // /// owner id pas korte hobe.
                          if (owner.owner?.id != null) {
                            controller.ownerDetails(owner.owner!.id!);
                          } else {
                            Get.snackbar("Error", "Owner ID not found");
                          }
                        },
                      );
                    }).toList(),
                  )
                ]),
              ),
            ),
          ],
        );
      }),
    );
  }
}
