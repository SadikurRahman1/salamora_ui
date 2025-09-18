import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import 'package:selemara/core/widgets/custom_text_form_field.dart';
import 'package:selemara/features/car_owner_flow/profile/widget/custom_text_field.dart';

import '../../../../core/widgets/custom_button.dart';

class ServiceRequest extends StatelessWidget {
  ServiceRequest({super.key});

  final res = AppResponsive();
  final TextEditingController declineController = TextEditingController();
  final TextEditingController approveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "service_request".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "oil_change".tr,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.redLight,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "Medium Priority",
                      color: AppColors.red,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Vehicle Information',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: res.hp(8)),

                  AppText(
                    '2020 Honda Civic',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  SizedBox(height: res.hp(8)),

                  Row(
                    children: [
                      AppText(
                        'Plate: A-12345',
                        color: AppColors.textColor626,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      SizedBox(width: res.wp(8)),
                      Container(
                        width: res.wp(8),
                        height: res.wp(8),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: res.wp(8)),
                      AppText(
                        "VIN: IHGBH41JXMN109186",
                        color: AppColors.textColor626,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),

                  SizedBox(height: res.hp(16)),
                  AppText(
                    'Customer Information',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: res.hp(8)),

                  AppText(
                    'Ahmed Al Mansouri',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  SizedBox(height: res.hp(8)),

                  Row(
                    children: [
                      AppText(
                        '+971-50-123-4567',
                        color: AppColors.textColor626,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                      SizedBox(width: res.wp(8)),
                      Container(
                        width: res.wp(8),
                        height: res.wp(8),
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: res.wp(8)),
                      AppText(
                        "ahmed@example.com",
                        color: AppColors.textColor626,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  SizedBox(height: res.hp(16)),
                  AppText(
                    "Service Description",
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(height: res.hp(8)),

                  AppText(
                    'Regular oil change service needed. Vehicle has 45,000 miles.',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  SizedBox(height: res.hp(8)),

                  AppText(
                    'Date: 1/20/2024',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  SizedBox(height: res.hp(8)),

                  AppText(
                    'Preferred Date: 2/15/2024',
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  SizedBox(height: res.hp(8)),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: 'Decline Request',
                      btnColor: AppColors.red,
                      onTap: () => _showDeclineDialog(context, res),
                    ),
                  ),
                  SizedBox(width: res.wp(10)),
                  Expanded(
                    child: CustomButton(
                      text: 'Approve Request',
                      btnColor: AppColors.primaryColor1,
                      onTap: () => _showApproveDialog(context, res),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _showDeclineDialog(BuildContext context, AppResponsive res) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.whitColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "Respond to service Request",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.primaryColor1,
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.close, color: AppColors.primaryColor1),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: res.hp(10)),
            AppText("Estimated Cost", color: AppColors.textColor),
            SizedBox(height: res.hp(10)),

            TextField(
              controller: TextEditingController(),
              decoration: const InputDecoration(
                hintText: "Enter your Estimated Cost",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: res.hp(10)),

            AppText("Additional Notes", color: AppColors.textColor),
            SizedBox(height: res.hp(10)),

            TextField(
              controller: TextEditingController(),
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Enter approval note",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  text: "cancel",
                  btnColor: AppColors.primaryColor.withAlpha(24),
                  textColor: AppColors.textColor,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: res.wp(10)),
              Expanded(
                child: CustomButton(
                  text: "Submit",
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}

void _showApproveDialog(BuildContext context, AppResponsive res) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: AppColors.whitColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              "Respond to service Request",
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: AppColors.primaryColor1,
            ),
            GestureDetector(
              onTap: () => Get.back(),
              child: Icon(Icons.close, color: AppColors.primaryColor1),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: res.hp(10)),
            AppText("Reason for Decline", color: AppColors.textColor),
            SizedBox(height: res.hp(10)),

            TextField(
              controller: TextEditingController(),
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: "Any additional information for the customer...",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomButton(
                  text: "cancel",
                  btnColor: AppColors.primaryColor.withAlpha(24),
                  textColor: AppColors.textColor,
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
              SizedBox(width: res.wp(10)),
              Expanded(
                child: CustomButton(
                  text: "Submit",
                  onTap: () {
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
