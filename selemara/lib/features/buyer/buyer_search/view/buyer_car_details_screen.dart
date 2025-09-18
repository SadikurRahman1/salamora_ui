import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/api_urls.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../dealership/common/widgets/dealer_history_card_widget.dart';
import '../buyer_records/views/buyer_ownership_history.dart';
import '../controller/buyer_search_controller.dart';
import '../model/buyer_vin_search_model.dart';
import '../../home/widgets/buyer_vehicle_document_card.dart';
import '../../../../core/routes/app_routes.dart';

class BuyerCarDetailsScreen extends StatelessWidget {
  const BuyerCarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // BuyerSearchController controller = Get.put(BuyerSearchController(),permanent: true);
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
            _carImageCard(res),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            _carDetailsCard(res),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: CustomButton(
                text: "view_ownership_history".tr,
                iconPath: AppIcons.multipleUser,
                iconColor: AppColors.primaryColor,
                btnColor: AppColors.primaryColor.withAlpha(40),
                textColor: AppColors.primaryColor,
                // isLoading: controller.isLoading.value,
                onTap: () {
                  Get.to(() => BuyerOwnershipHistory());
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            _activeWarrantyCard(res),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            _carDocumentsCard(res),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: AppText(
                "service_history".tr,
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BuyerHistoryCardWidget(
                    color: true,
                    title: "Oil Change & Fitter",
                    date: "1/1/2024",
                    serviceCenter: "Al Futtaim Service Center",
                    statusLabel: "Warranty",
                    invoiceLabel: "Invoice",
                    onTapOilChange: () {},
                    onTapWarranty: () {},
                    onTapInvoice: () {},
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.wp(70))),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        label: Text(
          "contact_now".tr,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  /// Car Images
  Widget _carImageCard(AppResponsive res) {
    return SliverToBoxAdapter(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              AppImages.carImage,
              height: res.hp(198),
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          // Top-left verified icon
          Positioned(
            top: 12,
            left: 12,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(
                  AppIcons.verified,
                  height: res.hp(24),
                  width: res.hp(89),
                ),
              ),
            ),
          ),
          // Top-right save icon
          // Positioned(
          //   top: 12,
          //   right: 12,
          //   child: GestureDetector(
          //     onTap: () {},
          //     child: Container(
          //       padding: const EdgeInsets.all(6),
          //       decoration: BoxDecoration(
          //         color: AppColors.whitColor,
          //         shape: BoxShape.circle,
          //       ),
          //       child: Image.asset(
          //         AppIcons.saveActive,
          //         height: res.hp(16),
          //         width: res.hp(16),
          //         color: AppColors.primaryColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  /// Car Details Card
  Widget _carDetailsCard(AppResponsive res) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4.0,
              spreadRadius: 0.5,
              offset: const Offset(2, 2),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "2020 Honda Civic",
                        color: AppColors.textColor2A2A,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          AppText(
                            "Black",
                            color: AppColors.textColor626,
                            fontSize: 14,
                          ),
                          const SizedBox(width: 8),
                          Container(
                            height: res.wp(8),
                            width: res.wp(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.bordarColor,
                            ),
                          ),
                          const SizedBox(width: 8),
                          AppText(
                            "45,000 miles",
                            color: AppColors.textColor626,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppText(
                  "6860",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _labelValueRow("VIN", "CV2F6JLOOOOOO"),
            const SizedBox(height: 8),
            _labelValueRow("make".tr, "Honda"),
            const SizedBox(height: 8),
            _labelValueRow("model".tr, "Civic"),
            const SizedBox(height: 8),
            _labelValueRow("year".tr, "2020"),
            const SizedBox(height: 8),
            _labelValueRow("Documents", "3 uploaded"),
          ],
        ),
      ),
    );
  }

  Widget _labelValueRow(String key, String value) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: AppText(
            key,
            color: AppColors.textColor626,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.topRight,
            child: AppText(
              value,
              color: AppColors.textColor626,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  /// Active Warranty Card
  Widget _activeWarrantyCard(AppResponsive res) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          Get.toNamed(AppRoutes.warrantyDetailsScreen);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
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
                        "Honda UAE",
                        color: AppColors.greenColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
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
                      "N/A",
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
    );
  }

  /// Vehicle Documents Card
  Widget _carDocumentsCard(AppResponsive res) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 4.0,
              spreadRadius: 0.5,
              offset: const Offset(2, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              "vehicle_documents".tr,
              color: AppColors.textColor626,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: res.hp(16)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 3,
              itemBuilder: (context, index) {
                return BuyerVehicleDocumentCard(
                  policyTitle: "Auto Insurance Policy",
                  insuranceType: "Document".tr,
                  startDate: "1/1/2024",
                  // API দিতে হবে
                  expiryDate: "12/31/2024",
                  // API দিতে হবে
                  onDelete: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
