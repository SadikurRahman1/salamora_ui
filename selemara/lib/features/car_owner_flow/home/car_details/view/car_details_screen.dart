import 'package:flutter/material.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../controller/home_controller_owner.dart';
import '../../widget/vehicle_document_card.dart';
import 'package:get/get.dart';

class CarDetailsScreen extends StatelessWidget {
  CarDetailsScreen({super.key});

  final HomeControllerOwner controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var arg = Get.arguments;
    int index = arg["index"];
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),

        // actions: [
        //   Theme(
        //     data: Theme.of(context).copyWith(
        //       popupMenuTheme: PopupMenuThemeData(
        //         color: Colors.white, // ✅ background white
        //       ),
        //     ),
        //     child: PopupMenuButton<String>(
        //       icon: Icon(Icons.more_vert, color: AppColors.primaryTextColor),
        //       onSelected: (value) {
        //         if (value == 'edit') {
        //           // Handle Edit
        //         } else if (value == 'delete') {
        //           // Handle Delete
        //         }
        //       },
        //       itemBuilder: (context) => [
        //         PopupMenuItem(
        //           value: 'edit',
        //           child: Row(
        //             children: [
        //               Icon(Icons.edit, color: Colors.black54),
        //               SizedBox(width: 8),
        //               Text("Edit"),
        //             ],
        //           ),
        //         ),
        //         PopupMenuItem(
        //           value: 'delete',
        //           child: Row(
        //             children: [
        //               Icon(Icons.delete, color: Colors.redAccent),
        //               SizedBox(width: 8),
        //               Text("Delete"),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ]
      ),

      body: Obx(() {
        var carDetails = controller.allCarList.value?.data[index];
        String baseUrl = "http://172.252.13.78:5013";

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

              SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    "$baseUrl${carDetails?.images[0]}",
                    fit: BoxFit.cover,
                  ),
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
                                  carDetails?.name ?? "", // "2020 Honda Civic"
                                  color: AppColors.textColor2A2A,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                                Padding(padding: EdgeInsets.only(top: 4)),

                                Row(
                                  children: [
                                    AppText(
                                      carDetails?.color ?? "", // "Silver"
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
                                      "${carDetails?.currentMileage.toString()}  miles",
                                      // "45,000 miles"
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

                      _labelValueRow("vin_label".tr, carDetails?.vin ?? "", context,),
                      Padding(padding: EdgeInsets.only(top: 8)),
                      _labelValueRow(
                        "last_service".tr,
                        carDetails?.lastService ?? "0", context,
                      ),

                      Padding(padding: EdgeInsets.only(top: 8)),
                      _labelValueRow("service_record".tr,carDetails?.totalService.toString()?? "", context,),

                      Padding(padding: EdgeInsets.only(top: 8)),
                      _labelValueRow("documents".tr,carDetails?.documents.length.toString()??"", context,),
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
                                "warranty_expiry".tr, // "6/15/2025"
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
                        btnColor: AppColors.primaryColor1,
                        borderColor: AppColors.primaryColor1,
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
                    CustomButton(
                      btnColor: Color(0xFFF5F5F5),
                      textIconWidth: 0,
                      text: "full_service_history".tr,

                      // Cancel
                      onTap: () {},
                      textColor: Color(0xFF2E3A49),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(30))),
            ],
          ),
        );
      }),
    );
  }

  Row _labelValueRow(String kye, String value, BuildContext context) {
    final isRTL = Directionality.of(context) == TextDirection.rtl;

    return Row(
      textDirection: isRTL ? TextDirection.rtl : TextDirection.ltr, // ✅ RTL/LTR aware
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: isRTL ? Alignment.topRight : Alignment.topLeft, // ✅ RTL flip
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
            alignment: isRTL ? Alignment.topLeft : Alignment.topRight, // ✅ RTL flip
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
  }}
