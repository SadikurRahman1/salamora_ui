import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../widgets/cover_service_widget.dart';

class BuyerServiceHistoryDetailsScreen extends StatelessWidget {
  BuyerServiceHistoryDetailsScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "service_history_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: AppText(
                "service_info".tr,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    "oil_change_and_filter".tr,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      "6/15/2025",
                      color: AppColors.whitColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: AppText(
                "Full synthetic oil change and filter replacement Checked all fluid levels and tire pressure.",
                color: AppColors.textColor626,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(Icons.calendar_month, color: AppColors.primaryColor),
                  SizedBox(width: res.wp(8)),

                  AppText(
                    "1/15/2024",
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: AppColors.primaryColor,
                  ),
                  SizedBox(width: res.wp(8)),
                  AppText(
                    "al_futtaim_service_center".tr,
                    color: AppColors.textColor626,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.download,
                        height: res.hp(16),
                        width: res.wp(16),
                      ),
                      SizedBox(width: res.wp(8)),
                      AppText(
                        "invoice".tr,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppIcons.download,
                        height: res.hp(16),
                        width: res.wp(16),
                      ),
                      SizedBox(width: res.wp(8)),

                      AppText(
                        "warranty".tr,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "\$65.99",
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "${"covered_services".tr}:",
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: CoveredServicesWidget(
                services: [
                  "Engine Checkup",
                  "Oil Change",
                  "AC Service",
                  "Brake Inspection",
                ],
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),
            SliverToBoxAdapter(
              child: AppText(
                "service_info".tr,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  AppText(
                    "elitepolish_auto_care".tr,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                  SizedBox(width: res.wp(8)),

                  Image.asset(
                    AppIcons.model,
                    height: res.hp(24),
                    width: res.wp(24),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(12))),

            SliverToBoxAdapter(
              child: AppText(
                "ElitePolish Auto Care offers premium car cleaning and detailing services designed to keep your vehicle looking its best. With fast, reliable, and affordable solutions, we provide exterior washes, interior detailing,",
                color: AppColors.textColor7085,
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(28))),

            SliverToBoxAdapter(
              child: AppText(
                "services".tr,
                color: AppColors.textColor,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    // padding: EdgeInsets.all(9),
                    decoration: BoxDecoration(
                      color: AppColors.whitColor,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4.0,
                          spreadRadius: 0.5,
                          offset: const Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 16,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppText(
                            "Exterior Cleaning",
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                          AppText(
                            "AED7",
                            color: AppColors.textColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
