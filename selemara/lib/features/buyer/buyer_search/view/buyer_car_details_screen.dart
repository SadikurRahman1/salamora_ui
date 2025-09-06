// import 'package:flutter/material.dart';
// import 'package:selemara/core/constants/app_images.dart';
// import 'package:selemara/features/buyer/buyer_search/model/buyer_vin_search_model.dart';
// import '../../../../../core/constants/app_colors.dart';
// import '../../../../../core/constants/app_icons.dart';
// import '../../../../../core/constants/app_responsive.dart';
// import '../../../../../core/widgets/app_text.dart';
// import '../../../../../core/widgets/custom_appbar.dart';
// import 'package:get/get.dart';
// import '../../../../core/routes/app_routes.dart';
// import '../../buyer_search/controller/buyer_search_controller.dart';
// import '../widgets/buyer_history_card_widget.dart';
// import '../widgets/buyer_vehicle_document_card.dart';
//
// class BuyerCarDetailsScreen extends StatelessWidget {
//   const BuyerCarDetailsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     BuyerSearchController controller = Get.find<BuyerSearchController>();
//
//     final res = AppResponsive();
//     return Scaffold(
//       appBar: CustomAppBar(
//         title: "car_details".tr,
//         centerTitle: true,
//         leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
//       ),
//
//       body: Obx(() {
//         final vehicle = controller.vehicle.value;
//         if (vehicle == null) {
//           return const Center(child: CircularProgressIndicator());
//         }
//
//         return Padding(
//           padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
//           child: CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),
//
//               _carImageCard(res, vehicle.images),
//
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
//
//               _carDetailsCard(res, vehicle),
//
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
//
//               _activeWarrantyCard(res, vehicle),
//
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
//
//               _carDocumentsCard(res, vehicle.documents),
//
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
//
//               SliverToBoxAdapter(
//                 child: AppText(
//                   "Service History",
//                   color: AppColors.textColor,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
//
//               SliverToBoxAdapter(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   physics: NeverScrollableScrollPhysics(),
//                   itemCount: controller.serviceHistoryList.length,
//                   itemBuilder: (context, index) {
//                     final item = controller.serviceHistoryList[index];
//
//                     return BuyerHistoryCardWidget(
//                       color: true,
//                       title: item.serviceType,
//                       date:
//                           item.preferredDate != null
//                               ? item.preferredDate!.toLocal().toString().split(
//                                 ' ',
//                               )[0]
//                               : "-",
//                       serviceCenter: item.garage?.business?.businessName ?? "-",
//                       statusLabel: "Warranty",
//                       invoiceLabel: "Invoice",
//                       onTapOilChange: () {},
//                       onTapWarranty: () {},
//                       onTapInvoice: () {},
//                     );
//                   },
//                 ),
//               ),
//               SliverToBoxAdapter(child: SizedBox(height: res.wp(62))),
//
//             ],
//           ),
//         );
//       }),
//
//       floatingActionButton: FloatingActionButton.extended(
//         onPressed: () {},
//         backgroundColor: AppColors.primaryColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//         label: Text(
//           "contact_now".tr,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
//
//   /// method
//
//   Widget _carImageCard(AppResponsive res, List<String>? images) {
//     final imageUrl =
//         (images != null && images.isNotEmpty)
//             ? images.first
//             : AppImages.carImage;
//
//     return SliverToBoxAdapter(
//       child: Stack(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child:
//                 (imageUrl.startsWith(""))
//                     ? Image.network(
//                       "http://172.252.13.78:5013$imageUrl",
//                       height: res.hp(198),
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     )
//                     : Image.asset(
//                       imageUrl,
//                       height: res.hp(198),
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//           ),
//
//           // Top-left button
//           Positioned(
//             top: 12,
//             left: 12,
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(shape: BoxShape.circle),
//                 child: Image.asset(
//                   AppIcons.verified,
//                   height: res.hp(24),
//                   width: res.hp(89),
//                 ),
//               ),
//             ),
//           ),
//
//           // Top-right button
//           Positioned(
//             top: 12,
//             right: 12,
//             child: GestureDetector(
//               onTap: () {},
//               child: Container(
//                 padding: const EdgeInsets.all(6),
//                 decoration: BoxDecoration(
//                   color: AppColors.whitColor,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Image.asset(
//                   AppIcons.saveActive,
//                   height: res.hp(16),
//                   width: res.hp(16),
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _carDetailsCard(AppResponsive res, VehicleModel vehicle) {
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: EdgeInsets.all(16),
//
//         decoration: BoxDecoration(
//           color: AppColors.whitColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 4.0,
//               spreadRadius: 0.5,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//
//         child: Column(
//           children: [
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       AppText(
//                         "${vehicle.year} ${vehicle.brand} ${vehicle.model}",
//                         color: AppColors.textColor2A2A,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w600,
//                       ),
//                       SizedBox(height: 4),
//
//                       Row(
//                         children: [
//                           AppText(
//                             vehicle.color ?? "Unknown",
//                             color: AppColors.textColor626,
//                             fontSize: 14,
//                           ),
//                           SizedBox(width: 8),
//                           Container(
//                             height: res.wp(8),
//                             width: res.wp(8),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.bordarColor,
//                             ),
//                           ),
//                           SizedBox(width: 8),
//                           AppText(
//                             "${vehicle.currentMileage ?? 0} miles",
//                             color: AppColors.textColor626,
//                             fontSize: 14,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 AppText(
//                   vehicle.sellPrice != null ? "\$${vehicle.sellPrice}" : "0",
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold,
//                   color: AppColors.primaryColor,
//                 ),
//               ],
//             ),
//
//             Padding(padding: EdgeInsets.only(top: 16)),
//
//             _labelValueRow("VIN", vehicle.vin ?? ""),
//             Padding(padding: EdgeInsets.only(top: 8)),
//             _labelValueRow("last_service".tr, "1/15/2024"),
//
//             /// Todo: api nai
//             Padding(padding: EdgeInsets.only(top: 8)),
//             _labelValueRow("next_service".tr, "4/15/2024"),
//
//             /// Todo: api nai
//             Padding(padding: EdgeInsets.only(top: 8)),
//             _labelValueRow("service_record".tr, "8"),
//
//             /// Todo: api nai
//             Padding(padding: EdgeInsets.only(top: 8)),
//             _labelValueRow(
//               "Documents",
//               "${vehicle.documents?.length ?? 0} uploaded",
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _labelValueRow(String kye, String value) {
//     return Row(
//       children: [
//         Expanded(
//           flex: 3,
//           child: AppText(
//             kye,
//             color: AppColors.textColor626,
//             fontSize: 14,
//             fontWeight: FontWeight.w500,
//           ),
//         ),
//         Expanded(
//           flex: 4,
//           child: Align(
//             alignment: Alignment.topRight,
//             child: AppText(
//               value,
//               color: AppColors.textColor626,
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _activeWarrantyCard(AppResponsive res, vehicle) {
//     return SliverToBoxAdapter(
//       child: GestureDetector(
//         onTap: () {
//           Get.toNamed(AppRoutes.warrantyDetailsScreen);
//         },
//
//         child: Container(
//           padding: EdgeInsets.all(16),
//
//           decoration: BoxDecoration(
//             color: AppColors.boxColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         AppIcons.activeWarr,
//                         height: res.hp(16),
//                         width: res.wp(16),
//                       ),
//
//                       SizedBox(width: res.wp(3)),
//                       AppText(
//                         "active_warranty".tr,
//                         color: AppColors.textColor2A2A,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ],
//                   ),
//
//                   AppText(
//                     "view".tr,
//                     color: AppColors.primaryColor,
//                     fontSize: 15,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ],
//               ),
//               SizedBox(height: res.hp(12)),
//
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     children: [
//                       Image.asset(
//                         AppIcons.honda,
//                         height: res.hp(32),
//                         width: res.wp(32),
//                       ),
//
//                       SizedBox(width: res.wp(3)),
//                       AppText(
//                         vehicle.name,
//                         color: AppColors.greenColor,
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ],
//                   ),
//                   Container(
//                     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//                     decoration: BoxDecoration(
//                       color: AppColors.greenColor,
//                       borderRadius: BorderRadius.circular(24),
//                     ),
//
//                     child: AppText(
//                       vehicle.warrantyExpireAt != null
//                           ? "${vehicle.warrantyExpireAt!.toLocal()}".split(
//                             " ",
//                           )[0]
//                           : "N/A",
//                       color: AppColors.whitColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.w400,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _carDocumentsCard(AppResponsive res, List<String>? docs) {
//     /// Todo: api nai
//     return SliverToBoxAdapter(
//       child: Container(
//         padding: EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: AppColors.whitColor,
//           borderRadius: BorderRadius.circular(12),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.shade300,
//               blurRadius: 4.0,
//               spreadRadius: 0.5,
//               offset: Offset(2, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             AppText(
//               "vehicle_documents".tr,
//               color: AppColors.textColor626,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//             ),
//             SizedBox(height: res.hp(16)),
//             if (docs != null && docs.isNotEmpty)
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemCount: docs.length,
//                 itemBuilder: (context, index) {
//                   return BuyerVehicleDocumentCard(
//                     /// Todo: api nai
//                     policyTitle: "auto_insurance_policy".tr,
//                     insuranceType: "insurance".tr,
//                     startDate: "1/1/2024",
//                     expiryDate: "12/31/2024",
//                     onDelete: () {},
//                   );
//                 },
//               )
//             else
//               AppText("No documents uploaded"),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_appbar.dart';
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
    BuyerSearchController controller = Get.put(BuyerSearchController(),permanent: true);
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Obx(() {
        final vehicle = controller.vehicle.value;
        if (vehicle == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),
              _carImageCard(res, vehicle.images),
              SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
              _carDetailsCard(res, vehicle),
              SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
              SliverToBoxAdapter(
                child: CustomButton(
                  text: "view_ownership_history",
                  iconPath: AppIcons.multipleUser,
                  iconColor: AppColors.primaryColor1,
                  btnColor: AppColors.primaryColor1.withAlpha(40),
                  textColor: AppColors.primaryColor1,
                  isLoading: controller.isLoading.value,
                  onTap: () {

                    controller.ownerHistory();

                  },
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
              _activeWarrantyCard(res, vehicle),
              SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
              _carDocumentsCard(res, vehicle.documents),
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
                child: Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }

                  if (!controller.isPaid.value) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: AppText("Please pay \$10 for unlocking",
                        color: AppColors.red,
                        fontSize: 16,),
                      ),
                    );
                  }

                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.serviceHistoryList.length,
                    itemBuilder: (context, index) {
                      final item = controller.serviceHistoryList[index];
                      return BuyerHistoryCardWidget(
                        color: true,
                        title: item.serviceType ?? "-",
                        date: item.preferredDate != null
                            ? item.preferredDate!.toLocal().toString().split(' ')[0]
                            : "-",
                        serviceCenter: item.garage?.business?.businessName ?? "-",
                        statusLabel: "Warranty",
                        invoiceLabel: "Invoice",
                        onTapOilChange: () {},
                        onTapWarranty: () {},
                        onTapInvoice: () {},
                      );
                    },
                  );
                }),
              ),
              SliverToBoxAdapter(child: SizedBox(height: res.wp(70))),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor1,
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
  Widget _carImageCard(AppResponsive res, List<String>? images) {
    final imageUrl = (images != null && images.isNotEmpty)
        ? images.first
        : AppImages.carImage;

    return SliverToBoxAdapter(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              "http://10.0.20.216:5013$imageUrl",
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
    );
  }

  /// Car Details Card
  Widget _carDetailsCard(AppResponsive res, VehicleData vehicle) {
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
                        "${vehicle.year} ${vehicle.brand} ${vehicle.model}",
                        color: AppColors.textColor2A2A,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          AppText(
                            vehicle.color,
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
                            "${vehicle.currentMileage} miles",
                            color: AppColors.textColor626,
                            fontSize: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                AppText(
                  vehicle.sellPrice != null ? "\$${vehicle.sellPrice}" : "0",
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor1,
                ),
              ],
            ),
            const SizedBox(height: 16),
            _labelValueRow("VIN", vehicle.vin),
            const SizedBox(height: 8),
            _labelValueRow("make".tr, "------"),
            const SizedBox(height: 8),
            _labelValueRow("model".tr, vehicle.model),
            const SizedBox(height: 8),
            _labelValueRow("year".tr, vehicle.year),
            const SizedBox(height: 8),
            _labelValueRow(
              "Documents",
              "${vehicle.documents.length} uploaded",
            ),
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
  Widget _activeWarrantyCard(AppResponsive res, VehicleData vehicle) {
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
                        vehicle.name,
                        color: AppColors.greenColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.greenColor,
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: AppText(
                      vehicle.warrantyExpireAt ?? "N/A",
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
  Widget _carDocumentsCard(AppResponsive res, List<Document>? docs) {
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
            if (docs != null && docs.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];
                  return BuyerVehicleDocumentCard(
                    policyTitle: doc.name,
                    insuranceType: "Document".tr,
                    startDate: "-", // API দিতে হবে
                    expiryDate: "-", // API দিতে হবে
                    onDelete: () {},
                  );
                },
              )
            else
              AppText("No documents uploaded"),
          ],
        ),
      ),
    );
  }
}
