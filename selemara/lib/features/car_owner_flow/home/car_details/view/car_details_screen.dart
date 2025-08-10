import 'package:flutter/material.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../widget/vehicle_document_card.dart';
import 'package:get/get.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(AppImages.carImage, fit: BoxFit.cover),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "2020_car_title".tr,  // "2020 Honda Civic"
                                color: AppColors.textColor2A2A,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              Padding(padding: EdgeInsets.only(top: 4)),

                              Row(
                                children: [
                                  AppText(
                                    "color_silver".tr, // "Silver"
                                    color: AppColors.textColor626,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),

                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  Container(
                                    height: res.wp(8),
                                    width: res.wp(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: AppColors.bordarColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),

                                  AppText(
                                    "mileage_45000".tr, // "45,000 miles"
                                    color: AppColors.textColor626,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),


                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFe6f6f1),
                              borderRadius: BorderRadius.circular(res.sp(4)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x1AF0F4FD),
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(res.sp(4)),
                              child: Image.asset(
                                AppIcons.model,
                                height: res.hp(32),
                                width: res.wp(32),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    Padding(padding: EdgeInsets.only(top: 16)),

                    _labelValueRow("vin_label".tr, "CV2F6JLOOOOOO"),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("last_service".tr, "1/15/2024"),
                    Padding(padding: EdgeInsets.only(top: 8)),

                    _labelValueRow("next_service".tr, "4/15/2024"),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("service_records".tr, "8"),

                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("documents".tr, "2 uploaded"),
                  ],
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.warrantyDetailsScreen);
                },

                child: Container(
                  padding: EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: AppColors.boxColor,
                    borderRadius: BorderRadius.circular(8),
                  ),

                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.activeWarr,
                                height: res.hp(16),
                                width: res.wp(16),
                              ),

                              SizedBox(width: res.wp(3)),
                              AppText(
                                "active_warranty".tr,
                                color: AppColors.textColor2A2A,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),

                          AppText(
                            "view".tr,
                            color: AppColors.primaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                      SizedBox(height: res.hp(12)),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                AppIcons.honda,
                                height: res.hp(32),
                                width: res.wp(32),
                              ),

                              SizedBox(width: res.wp(3)),
                              AppText(
                                "honda_uae".tr,
                                color: AppColors.greenColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.greenColor,
                              borderRadius: BorderRadius.circular(24),
                            ),

                            child: AppText(
                              "warranty_expiry".tr,  // "6/15/2025"
                              color: AppColors.whitColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    AppText(
                      "vehicle_documents".tr,
                      color: AppColors.textColor626,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),

                    VehicleDocumentCard(
                      policyTitle: "auto_insurance_policy".tr,
                      insuranceType: "insurance".tr,
                      startDate: "1/1/2024",
                      expiryDate: "12/31/2024",
                      onDelete: () {},
                    ),

                    SizedBox(height: res.hp(8)),

                    VehicleDocumentCard(
                      policyTitle: "extended_warranty".tr,
                      insuranceType: "insurance".tr,
                      startDate: "1/1/2024",
                      expiryDate: "12/31/2024",
                      onDelete: () {},
                    ),

                    SizedBox(height: res.hp(16)),

                    CustomButton(
                      text: 'upload_document'.tr,
                      onTap: () {},
                      iconPath: AppIcons.upload,
                      iconColor: AppColors.whitColor,
                      iconHeight: 20,
                      iconWidth: 20,
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "service_history".tr,
                      onTap: () {
                        Get.toNamed(AppRoutes.serviceHistoryScreen);
                      },
                      btnColor: Color(0xFFe6f6f1),
                      textColor: AppColors.greenColor,
                    ),
                  ),
                  SizedBox(width: res.wp(20)),
                  Expanded(
                    child: CustomButton(
                      text: "request_service".tr,
                      onTap: () {
                        Get.toNamed(AppRoutes.requestServiceScreen);
                      },
                      btnColor: Color(0xFFffefe9),
                      textColor: AppColors.orange,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(30))),
          ],
        ),
      ),
    );
  }


  Row _labelValueRow(String kye, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.topLeft,
            child: AppText(
              kye,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Align(
            alignment: Alignment.topRight,
            child: AppText(
              value,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
