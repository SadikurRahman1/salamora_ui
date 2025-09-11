import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import 'package:selemara/features/dealership/dealer_cars/car_details/CarFeature/views/sell_vehicle_screen.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../controller/dealer_car_controller.dart';
import '../../widgets/car_image_card.dart';
import '../CarFeature/views/dealer_car_service_history_screen.dart';

class DealerCarDetailsScreen extends StatelessWidget {
  const DealerCarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    DealerCarController controller = Get.find<DealerCarController>();
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: Obx(() {
          if (controller.isLoading.value) {
            return buildSimpleDealerCarShimmer(res);
          }
          final vehicle = controller.singleVehicles.first;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

              SliverToBoxAdapter(
                child: CarImageCard(
                  imagePath:
                      vehicle.images.isNotEmpty
                          ? vehicle.images.first
                          : AppImages.carImage,
                  title: "${vehicle.year} ${vehicle.brand} ${vehicle.name}",
                  price: "\$${vehicle.price ?? '0'}",
                  miles: vehicle.currentMileage.toString(),
                  services: '',
                  carColor: vehicle.color,
                  date:
                      vehicle.createdAt != null
                          ? vehicle.createdAt!.toString().split(" ").first
                          : "-",
                  model: vehicle.vin,
                  onContactTap: () {},
                  isVerified: vehicle.isVerified,
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

              // নিচে আপনার বাটন গুলো থাকবে
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'sell_vehicle'.tr,
                            textColor:
                                vehicle.isSold
                                    ? AppColors.textColor.withAlpha(50)
                                    : AppColors.textColor,
                            iconPath: AppIcons.car1,
                            iconColor:
                                vehicle.isSold
                                    ? AppColors.textColor.withAlpha(50)
                                    : AppColors.textColor,
                            btnColor:
                                vehicle.isSold
                                    ? AppColors.primaryColor1.withAlpha(8)
                                    : AppColors.primaryColor1.withAlpha(40),
                            onTap: () {
                              if (!vehicle.isSold) {
                                Get.to(() => SellVehicleScreen());
                              }
                            },
                          ),
                        ),
                        SizedBox(width: res.wp(20)),
                        Expanded(
                          child: CustomButton(
                            text: 'invoice'.tr,
                            textColor: AppColors.textColor,
                            iconPath: AppIcons.invoice,
                            iconColor: AppColors.textColor,
                            btnColor: AppColors.primaryColor1.withAlpha(40),
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.dealerCreateInvoiceVehicleWarranty,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: res.hp(16)),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            text: 'warranty'.tr,
                            textColor: AppColors.textColor,
                            iconPath: AppIcons.warranty,
                            iconColor: AppColors.textColor,
                            btnColor: AppColors.primaryColor1.withAlpha(40),
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.dealerCreateVehicleWarranty,
                              );
                            },
                          ),
                        ),
                        SizedBox(width: res.wp(20)),
                        Expanded(
                          child: CustomButton(
                            text: 'service_history'.tr,
                            textColor: AppColors.textColor,
                            iconPath: AppIcons.history,
                            iconColor: AppColors.textColor,
                            btnColor: AppColors.primaryColor1.withAlpha(40),
                            onTap: () {
                              Get.to(() => DealerCarServiceHistoryScreen());
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
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
