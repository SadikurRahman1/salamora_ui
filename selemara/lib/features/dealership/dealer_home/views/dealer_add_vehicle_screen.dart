import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../buyer/common/widgets/buyer_get_image.dart';
import '../../../car_owner_flow/profile/widget/custom_text_field.dart';
import '../controller/dealer_add_vehicle_controller.dart';
import '../widgets/dealer_car_info_section.dart';
import '../widgets/multiple_image_selector.dart';

class DealerAddVehicleScreen extends StatelessWidget {
  DealerAddVehicleScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final DealerAddVehicleController controller =
      Get.find<DealerAddVehicleController>();

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "add_vehicle".tr, // Add Vehicle
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: Form(
          key: _formKey,
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

              SliverToBoxAdapter(
                child: AppText(
                  "vehicle_information".tr, // Vehicle Information
                  color: AppColors.textColor2A2A,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

              DealerCarInfoCard(
                controllerA: controller.vinController,
                controllerB: controller.carNameController,
                label1: "vin".tr,
                // VIN
                label2: "car_name".tr,
                // Car Name
                hint1: "car_owner".tr,
                // Car Owner
                hint2: "450000",
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

              DealerCarInfoCard(
                controllerA: controller.makeController,
                controllerB: controller.modelController,
                label1: "car_make".tr,
                // Car Make
                label2: "car_model".tr,
                // Car Model
                hint1: "e.g_honda".tr,
                // e.g., Honda
                hint2: "e.g_civic".tr, // e.g., Civic
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

              DealerCarInfoCard(
                controllerA: controller.yearController,
                controllerB: controller.colorController,
                label1: "year".tr,
                // Year
                label2: "color".tr,
                // Color
                hint1: "2024",
                hint2: "silver".tr, // Silver
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

              // DealerCarInfoCard(
              //   controllerA: controller.expiresController,
              //   controllerB: controller.tremsController,
              //   label1: "expires_date".tr,
              //   // Expires Date
              //   label2: "terms".tr,
              //   // Terms
              //   hint1: "2024",
              //   hint2: "silver".tr, // Silver (maybe change to something else)
              // ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

              SliverToBoxAdapter(
                child: AppText(
                  "current_mileage".tr, // Current Mileage
                  color: AppColors.secondryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

              SliverToBoxAdapter(
                child: CustomTextField(
                  borderRadius: 24,
                  bordarColor: AppColors.borderColor3f3,
                  controller: controller.currentController,
                  hintText: "450000",
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

              SliverToBoxAdapter(
                child: AppText(
                  "upload_vehicle_image".tr, // Upload Vehicle Image
                  color: AppColors.secondryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    GetImageFromGalleryMultiple().chooseImage(
                      context,
                      onSingleTap: (image) {
                        controller.addVehicleFile(File(image.path));
                      },
                      onMultipleTap: (images) {
                        for (var img in images) {
                          controller.addVehicleFile(File(img.path));
                        }
                      },
                    );

                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 39),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppIcons.upload,
                          height: res.hp(32),
                          width: res.wp(32),
                        ),
                        SizedBox(height: res.hp(16)),

                        AppText(
                          "click_to_upload_images_max_6"
                              .tr, // Click to upload images (Max 6)
                          color: AppColors.secondryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: res.hp(8)),

                        AppText(
                          "png_jpg_up_to_10mb_each"
                              .tr, // PNG, JPG up to 10MB each
                          color: AppColors.secondryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

              SliverToBoxAdapter(
                child: AppText(
                  "upload_document".tr, // Upload Document
                  color: AppColors.secondryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

              SliverToBoxAdapter(
                child: GestureDetector(
                  onTap: () {
                    // GetImageFromGalleryCamera().chooseImage(context, (image) {
                    //   log("............$image............");
                    //   controller.documentFile.value = File(image.path);
                    // });

                    GetImageFromGalleryMultiple().chooseImage(
                      context,
                      onSingleTap: (image) {
                        controller.addDocumentFile(File(image.path));
                      },
                      onMultipleTap: (images) {
                        for (var img in images) {
                          controller.addDocumentFile(File(img.path));
                        }
                      },
                    );

                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 17, vertical: 39),
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFFCCCCCC)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        Image.asset(
                          AppIcons.upload,
                          height: res.hp(32),
                          width: res.wp(32),
                        ),
                        SizedBox(height: res.hp(16)),

                        AppText(
                          "click_to_upload_images_max_6"
                              .tr, // Click to upload images (Max 6)
                          color: AppColors.secondryTextColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: res.hp(8)),

                        AppText(
                          "png_jpg_up_to_10mb_each"
                              .tr, // PNG, JPG up to 10MB each
                          color: AppColors.secondryTextColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

              SliverToBoxAdapter(
                child: Row(
                  children: [
                    Expanded(
                      child: CustomButton(
                        btnColor: Color(0xFFF5F5F5),
                        textIconWidth: 0,
                        text: "cancel".tr,
                        // Cancel
                        onTap: () {},
                        textColor: Color(0xFFACACAC),
                      ),
                    ),

                    SizedBox(width: res.wp(20)),
                    Expanded(
                      child: CustomButton(
                        btnColor: AppColors.primaryColor1,
                        text: "add_vehicle".tr, // Add Vehicle
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            controller.submitVehicle();
                          }

                        },
                      ),
                    ),
                  ],
                ),
              ),

              SliverToBoxAdapter(child: SizedBox(height: res.wp(52))),
            ],
          ),
        ),
      ),
    );
  }
}
