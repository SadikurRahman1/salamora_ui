import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import 'oil_change_widgets.dart';

class BuyerOwnershipDetails extends StatelessWidget {
  BuyerOwnershipDetails({super.key});

  final res = AppResponsive();

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
                      "${"ownership_details".tr} - name",
                      color: AppColors.textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                SizedBox(height: res.hp(12)),

                _personalInformation(),

                SizedBox(height: res.hp(12)),

                _ownerDetails(),

                SizedBox(height: res.hp(24)),
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
                  itemCount: 3,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InfoCard(
                      title: "oil_change".tr,
                      date: "12/12/12".tr,
                      company: "AutoCare Plus".tr,
                      miles: "Miles".tr,
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
              "${"name".tr} : Sadikur Rahman",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),

            AppText(
              "${"location".tr} : Dhaka",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"phone".tr} : 01213412423",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"email".tr} : 01213412423",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _ownerDetails() {
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
              "${"period".tr} : da",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),

            AppText(
              "${"duration".tr} : 2134",
              fontSize: 12,
              color: AppColors.textColor,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"mileage_range_sample".tr} : 123",
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: AppColors.textColor,
            ),
            SizedBox(height: res.hp(6)),
            AppText(
              "${"sale_date_example".tr} : 02/14/1423",
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
