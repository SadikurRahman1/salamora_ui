import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/routes/app_routes.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../widgets/buyer_vehicle_document_card.dart';

class BuyerCarDetailsScreen extends StatelessWidget {
  const BuyerCarDetailsScreen({super.key});

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

                  // Top-left button
                  Positioned(
                    top: 12,
                    left: 12,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset(
                          AppIcons.verified,
                          height: res.hp(24),
                          width: res.hp(89),
                        ),
                      ),
                    ),
                  ),

                  // Top-right button
                  Positioned(
                    top: 12,
                    right: 12,
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: AppColors.whitColor,
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          AppIcons.saveActive,
                          height: res.hp(16),
                          width: res.hp(16),
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                ],
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

                child: _carDetailsCard(res),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            _activeWarrantyCard(res),

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

                    SizedBox(height: res.hp(16)),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return BuyerVehicleDocumentCard(
                          policyTitle: "auto_insurance_policy".tr,
                          insuranceType: "insurance".tr,
                          startDate: "1/1/2024",
                          expiryDate: "12/31/2024",
                          onDelete: () {},
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: AppText(
                "Service History",
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(30))),
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(16),
                    margin: EdgeInsets.symmetric(vertical: 8),
                    decoration: BoxDecoration(
                      color: AppColors.whitColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 4.0,
                          spreadRadius: 0.5,
                          offset: Offset(2, 2),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppIcons.check1,
                                  height: res.hp(20),
                                  width: res.hp(20),
                                  // color: AppColors.primaryColor,
                                ),

                                SizedBox(width: res.wp(5)),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AppText(
                                      "Oil Change & Fitter".tr,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    SizedBox(height: res.hp(6)),
                                    AppText(
                                      "Al Futtaim Service Center".tr,
                                      color: AppColors.textColor2A2A,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    SizedBox(height: res.hp(6)),

                                    Row(
                                      children: [
                                        Icon(
                                          Icons.remove_red_eye_outlined,
                                          color: AppColors.primaryColor,
                                        ),
                                        SizedBox(width: 5),
                                        AppText(
                                          "warranty".tr,
                                          color: AppColors.primaryColor,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Column(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                    "warranty_expiry".tr,
                                    color: AppColors.whitColor,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.add),
                                    AppText(
                                      "invoice".tr,
                                      color: AppColors.textColor2A2A,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: res.hp(12)),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // বড় গোলাকার
        ),
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

  /// method

  Widget _activeWarrantyCard(AppResponsive res) {
    return SliverToBoxAdapter(
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(24),
                    ),

                    child: AppText(
                      "warranty_expiry".tr,
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

  Widget _carDetailsCard(AppResponsive res) {
    return Column(
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
                    "2020 Honda Civic",
                    color: AppColors.textColor2A2A,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  Padding(padding: EdgeInsets.only(top: 4)),

                  Row(
                    children: [
                      AppText(
                        "Silver",
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
                        "45,000 miles",
                        color: AppColors.textColor626,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppText(
              "\$254",
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
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
        _labelValueRow("service_record".tr, "8"),

        Padding(padding: EdgeInsets.only(top: 8)),
        _labelValueRow("documents".tr, "2 uploaded"),
      ],
    );
  }

  Widget _labelValueRow(String kye, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
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
        Expanded(
          flex: 3,
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
