import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/features/dealership/dealer_cars/car_details/CarFeature/views/sell_vehicle_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/routes/app_routes.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../common/widget/service_history_card_widget.dart';
import '../../../controller/dealer_car_controller.dart';
import '../controller/dealer_service_history_controller.dart';
import '../../../widgets/car_image_card.dart';

class DealerCarServiceHistoryScreen extends StatelessWidget {
  const DealerCarServiceHistoryScreen({super.key});

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
              child: CarImageCard(
                imagePath: AppImages.carImage,
                title: "2020 Toyota Camry",
                price: "23465",
                miles: "3733",
                services: '9',
                carColor: "Black",
                date: "1/15/2024",
                model: "Toyta",
                onContactTap: () {},
                isVerified: false,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),


            SliverToBoxAdapter(
              child: AppText(
                "service_history".tr,
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            // নিচে আপনার বাটন গুলো থাকবে
            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ServiceHistoryCardWidget(
                    color: (index % 2 == 0) ? true : false,
                    title: "Oil Change & Fitter",
                    date: "6/15/2025",
                    serviceCenter: "Al Futtaim Service Center",
                    statusLabel: "Warranty",
                    invoiceLabel: "Invoice",
                    onTapOilChange: () {
                      _showBeautifulBottomSheet(context);
                    },
                    onTapWarranty: () {

                    },
                    onTapInvoice: () {},
                  );
                },
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.wp(62))),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        label: Row(
          children: [
            Icon(Icons.add,color: AppColors.whitColor,),
            Text(
              "request_service".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }


  void _showBeautifulBottomSheet(BuildContext context) {
    final res = AppResponsive();
    DealerServiceHistoryController controller = Get.find<DealerServiceHistoryController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => Padding(
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
                        itemBuilder:
                            (_, __) =>
                            Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (newRating) {
                          controller.rating.value = newRating;
                        },
                      ),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(43)),

                CustomButton(text: "re_service".tr, onTap: () {}),

                SizedBox(height: res.hp(43)),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildSimpleDealerCarShimmer(AppResponsive res) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: res.hp(24)),

            // Image skeleton
            Container(
              height: res.hp(200),
              width: double.infinity,
              color: Colors.white,
            ),
            SizedBox(height: res.hp(20)),
            // Title skeleton
            Container(
              height: res.hp(20),
              width: res.wp(180),
              color: Colors.white,
            ),
            SizedBox(height: res.hp(8)),
            Container(
              height: res.hp(16),
              width: res.wp(120),
              color: Colors.white,
            ),
            SizedBox(height: res.hp(20)),

            // Buttons skeleton
            Row(
              children: [
                Expanded(
                  child: Container(height: res.hp(50), color: Colors.white),
                ),
                SizedBox(width: res.wp(20)),
                Expanded(
                  child: Container(height: res.hp(50), color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: res.hp(16)),
            Row(
              children: [
                Expanded(
                  child: Container(height: res.hp(50), color: Colors.white),
                ),
                SizedBox(width: res.wp(20)),
                Expanded(
                  child: Container(height: res.hp(50), color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: res.hp(20)),
          ],
        ),
      ),
    );
  }


}
