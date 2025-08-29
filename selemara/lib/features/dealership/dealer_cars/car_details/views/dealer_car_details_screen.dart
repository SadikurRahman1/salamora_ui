import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_icons.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../common/widgets/custom_text_field.dart';
import '../../widgets/car_image_card.dart';
import '../CarFeature/views/dealer_car_service_history_screen.dart';

class DealerCarDetailsScreen extends StatelessWidget {
  const DealerCarDetailsScreen({super.key});

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
                title: "2018 Honda Civic",
                price: "\$20,000",
                miles: "15,420",
                services: "8",
                carColor: "Black",
                date: "2024-01-15",
                model: "IHGCV2F6JLOOOOOO",
                onContactTap: () {
                  print("Contact Seller tapped!");
                },
                isPending: true,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'qr_code'.tr,

                          textColor: AppColors.textColor,
                          iconPath: AppIcons.qrCode,
                          iconColor: AppColors.textColor,
                          btnColor: AppColors.primaryColor1.withAlpha(40),
                          onTap: () {
                            _showBeautifulBottomSheet(context);
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
                            Get.toNamed(AppRoutes.dealerCreateInvoiceVehicleWarranty);
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
                            Get.toNamed(AppRoutes.dealerCreateVehicleWarranty);
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
        ),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          alignment: Alignment.center,
                          height: res.wp(64),
                          width: res.wp(64),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.primaryColor.withValues(
                              alpha: 0.1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppIcons.qrCode,
                              height: res.hp(32),
                              width: res.wp(32),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        AppText(
                          "scan_car_qr_code".tr,
                          fontSize: res.sp(16),
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryTextColor,
                        ),
                        SizedBox(height: res.hp(8)),
                        AppText(
                          "point_camera_qr".tr,
                          fontSize: res.sp(14),
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor.withValues(alpha: 0.8),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: res.hp(20)),
                      ],
                    ),

                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: "Enter VIN",
                      borderRadius: 25,
                    ),
                    SizedBox(height: res.hp(43)),

                    CustomButton(
                      text: "generate_qr_code".tr,
                      btnColor: AppColors.primaryColor1,
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
