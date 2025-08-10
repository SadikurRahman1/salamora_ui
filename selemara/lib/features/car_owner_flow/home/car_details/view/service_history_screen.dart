import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:selemara/features/car_owner_flow/home/car_details/controller/service_history_controller.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../widget/service_card.dart';
import 'package:get/get.dart';

class ServiceHistoryScreen extends StatelessWidget {
  ServiceHistoryScreen({super.key});

  final res = AppResponsive();
  final ServiceHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "service_history".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

                SliverToBoxAdapter(
                  child: AppText(
                    "honda_civic_2020_service_history".tr,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor2A2A,
                    fontSize: 20,
                  ),
                ),

                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: res.hp(16)),
                        child: ServiceCard(
                          onTapInvoice: () {
                            Get.toNamed(AppRoutes.invoiceDetailsScreen);
                          },
                          onTapOilChange: () {
                            _showBeautifulBottomSheet(context);
                          },
                          onTapWarranty: () {
                            Get.toNamed(AppRoutes.warrantyDetailsScreen);
                          },
                          color: (index % 2 == 0) ? false : true,
                          title: "oil_change_filter".tr,
                          date: "6/15/2025",
                          serviceCenter: "al_futtaim_service_center".tr,
                          companyName: "warranty".tr,
                          invoiceLabel: "invoice".tr,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 24,
            right: 30,
            child: SizedBox(
              width: res.wp(142),
              child: CustomButton(
                textIconWidth: 4,
                text: "request_service".tr,
                onTap: () {
                  // Get.toNamed(AppRoutes.addVehicleScreen);
                },
                fontSize: 12,
                iconWidth: 16,
                iconHeight: 16,
                iconPath: AppIcons.plus1,
                iconColor: AppColors.whitColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBeautifulBottomSheet(BuildContext context) {
    final res = AppResponsive();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: Image.asset(
                      AppIcons.cross,
                      height: res.hp(24),
                      width: res.wp(24),
                    ),
                  ),
                ),

                SizedBox(height: res.hp(24)),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      "oil_change_filter".tr,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      color: AppColors.textColor2A2A,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
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

                SizedBox(height: res.hp(17)),

                AppText(
                  "oil_change_description".tr,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: const Color(0xFF375d82),
                ),

                SizedBox(height: res.hp(10)),

                Row(
                  children: [
                    Image.asset(
                      AppIcons.calendar,
                      height: res.hp(16),
                      width: res.wp(24),
                      color: AppColors.primaryColor,
                    ),

                    SizedBox(width: res.wp(3)),

                    AppText(
                      "service_date_example".tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF515151),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(12)),

                Row(
                  children: [
                    Image.asset(
                      AppIcons.map,
                      height: res.hp(16),
                      width: res.wp(24),
                      color: AppColors.primaryColor,
                    ),

                    SizedBox(width: res.wp(3)),

                    AppText(
                      "al_futtaim_service_center".tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: const Color(0xFF515151),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(12)),

                Row(
                  children: [
                    Image.asset(
                      AppIcons.download,
                      height: res.hp(16),
                      width: res.wp(24),
                      color: AppColors.primaryColor,
                    ),

                    SizedBox(width: res.wp(3)),

                    AppText(
                      "download_invoice".tr,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),

                SizedBox(height: res.hp(12)),

                AppText(
                  '\$65.99',
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),

                SizedBox(height: res.hp(12)),

                Row(
                  children: [
                    AppText(
                      "your_rating".tr,
                      color: AppColors.textColor2A2A,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),

                    SizedBox(width: res.wp(8)),

                    Obx(
                          () => RatingBar.builder(
                        initialRating: controller.rating.value,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: res.wp(20),
                        itemBuilder: (_, __) => Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (newRating) {
                          controller.rating.value = newRating;
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(43)),

                CustomButton(
                  text: "re_service".tr,
                  onTap: () {},
                ),

                SizedBox(height: res.hp(43)),
              ],
            ),
          ),
        ),
      ),
    );
  }



}
