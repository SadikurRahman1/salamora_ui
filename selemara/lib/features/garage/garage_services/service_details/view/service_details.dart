import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import 'package:selemara/features/buyer/home/widgets/cover_service_widget.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../../dealership/dealer_cars/car_details/CarFeature/views/dealer_create_invoice_vehicle_warranty.dart';
import '../../../../dealership/dealer_cars/car_details/CarFeature/views/dealer_create_vehicle_warranty.dart';

class ServiceDetails extends StatelessWidget {
  ServiceDetails({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "service_details".tr,
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
                      horizontal: 12,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greenLight,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, color: AppColors.greenColor),
                        AppText("Add Parts", color: AppColors.greenColor),
                      ],
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
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: AppText(
                "Extra Parts".tr,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: CoveredServicesWidget(
                services: [
                  "Engine Checkup",
                  "Brake Inspection",
                  "AC Service",
                  "Oil Change",
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  CustomButton(
                    text: "Generate Invoice",
                    iconPath: AppIcons.invoice,
                    onTap: () {
                      Get.toNamed(AppRoutes.createServiceInvoice);
                    },
                  ),
                  SizedBox(height: res.hp(16)),
                  CustomButton(
                    text: "warranty",
                    iconPath: AppIcons.warranty,
                    iconColor: AppColors.primaryColor1,
                    textColor: AppColors.primaryColor1,
                    btnColor: AppColors.primaryColor1.withAlpha(24),
                    onTap: () {
                      Get.toNamed(AppRoutes.createPartsWarranty);

                    },
                  ),
                  SizedBox(height: res.hp(16)),
                  CustomButton(
                    text: "Transfer Service",
                    iconPath: AppIcons.invoice,
                    iconColor: AppColors.primaryColor1,
                    textColor: AppColors.primaryColor1,
                    btnColor: AppColors.primaryColor1.withAlpha(24),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),
          ],
        ),
      ),
    );
  }
}
