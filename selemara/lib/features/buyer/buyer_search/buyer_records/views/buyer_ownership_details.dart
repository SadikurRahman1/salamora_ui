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
      body: CustomScrollView(
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
                      "Owner Details - John Smith",
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: res.hp(12)),

                // Personal info
                _personalInformation(),
                SizedBox(height: res.hp(12)),

                // Owner info
                _ownerDetails(),
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
                  itemCount:  4,
                  itemBuilder: (context, index) {

                    return InfoCard(
                      title: "Oil Change",
                      date: "1/15/2024",
                      company:  "AutoCare Plus",
                      miles: " 4000 miles",
                    );
                  },
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _personalInformation() {
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
              "Name: John Smith",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Phone: (555) 123-4567",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Location: New York NY",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Email: john.smith@email.com",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerDetails( ) {
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
              "Period: 2022-01 to 2023-06",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Duration: 1 year 5 months",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Mileage Range: 8,500 miles",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "Sale Date: 2023-06-20",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }
}

