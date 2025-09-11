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
import '../../model/owner_details_model.dart';
import '../widgets/oil_change_widgets.dart';

class BuyerOwnershipDetails extends StatelessWidget {
  BuyerOwnershipDetails({super.key});


  String formatDate(String? isoDate) {
    if (isoDate == null) return "N/A";

    try {
      DateTime dt = DateTime.parse(isoDate).toLocal();
      return dt.toIso8601String().split('T')[0]; // Only date
    } catch (e) {
      return isoDate;
    }
  }

  final res = AppResponsive();
  final BuyerSearchController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        centerTitle: true,
        title: 'ownership_details'.tr,
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
          return buildShimmerList();
        }

        if (controller.ownerDetailsList.isEmpty) {
          return Center(child: Text("No owner details found"));
        }

        final owner = controller.ownerDetailsList.first;

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: res.hp(12)),
                  Row(
                    children: [
                      Image.asset(AppIcons.user, color: Colors.blue, width: 16),
                      SizedBox(width: res.wp(12)),
                      AppText(
                        "${"ownership_details".tr} - ${owner.name ?? "Unknown"}",
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: res.hp(12)),

                  // Personal info
                  _personalInformation(owner),
                  SizedBox(height: res.hp(12)),

                  // Owner info
                  _ownerDetails(owner),
                  SizedBox(height: res.hp(24)),

                  // Services
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.serviceInactive,
                        color: Colors.black,
                        width: 16,
                      ),
                      SizedBox(width: res.wp(12)),
                      AppText(
                        "service_ownership_details".tr,
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  SizedBox(height: res.hp(16)),

                  ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: owner.myServices?.length ?? 0,
                    itemBuilder: (context, index) {
                      final service = owner.myServices![index];
                      return InfoCard(
                        title: service.serviceType ?? "N/A",
                        date: formatDate(service.createdAt),
                        company: service.garage?.business?.location ?? "N/A",
                        miles: "${owner.currentMileage ?? 0} miles",
                      );
                    },
                  ),
                ]),
              ),
            ),
          ],
        );
      }),
    );
  }

  Widget _personalInformation(OwnerDetails owner) {
    return Card(
      color: AppColors.whitColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              "personal_information1".tr,
              fontSize: 16,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"name".tr} : ${owner.name ?? "N/A"}",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"location".tr} : ${owner.location ?? "N/A"}",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"business".tr} : ${owner.business ?? "N/A"}",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerDetails(OwnerDetails owner) {
    return Card(
      color: AppColors.whitColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              "ownership_details".tr,
              fontSize: 16,
              color: AppColors.textColor,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"period".tr} : ${formatDate(owner.createdAt)}",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"mileage_range_sample".tr} : ${owner.currentMileage ?? 0}",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"sale_date_example".tr} : ${owner.sellAt ?? "N/A"}",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
  Widget buildShimmerList() {
    return ListView.builder(
      itemCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            height: 200,
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

