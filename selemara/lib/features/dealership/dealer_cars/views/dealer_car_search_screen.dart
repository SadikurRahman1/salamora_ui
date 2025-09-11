import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../common/widgets/custom_dropdown_btn.dart';
import '../../common/widgets/recent_sales_widget.dart';
import '../car_details/views/dealer_car_details_screen.dart';
import '../controller/dealer_car_controller.dart';
import '../widgets/dropdown_and_btn.dart';

class DealerCarSearchScreen extends StatelessWidget {
  DealerCarSearchScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    DealerCarController controller = Get.find<DealerCarController>();

    return Scaffold(
      appBar: CustomAppBar(
        title: "search_cars".tr,
        centerTitle: true,
        // leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: res.hp(12)),
            AppText(
              "my_all_cars".tr,
              color: AppColors.textColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: res.hp(8)),

            AppText(
              "manage_cars_verified_records".tr,
              color: AppColors.textColor7085,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            SizedBox(height: res.hp(12)),

            CustomTextFormField(
              borderRadius: 25,
              prefixIcon: AppIcons.searchInActive,
              hintText: "search_cars_name".tr,
              controller: controller.carSearchTEController,
              onChanged: (val) {
                // controller.fetchDealerVehicle();
                controller.searchVehicle(val);
              },
            ),
            SizedBox(height: res.hp(8)),

            DropdownAndBtn(
              subtitle: 'Select Status',
              selectedValue: controller.selectStatus,
              dropdownItems: controller.statusList,
              buttonText: 'add_vehicle'.tr,
              onButtonTap: () {
                Get.toNamed(AppRoutes.dealerAddVehicleScreen);
              },
              buttonIconPath: AppIcons.plus,
            ),
            SizedBox(height: res.hp(10)),

            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return SizedBox(child: buildShimmerBox());
                }

                final filteredList =
                    controller.dealerVehicles.where((vehicle) {
                      // final searchText =
                      //     controller.carSearchTEController.text.toLowerCase();
                      // final matchesName =
                      //     vehicle.name?.toLowerCase().contains(searchText) ??
                      //     false;
                      final matchesStatus =
                          controller.selectStatus.value == "All Status" ||
                          controller.selectStatus.value.isEmpty ||
                          (controller.selectStatus.value == "Pending" &&
                              !vehicle.isVerified!) ||
                          (controller.selectStatus.value == "Completed" &&
                              vehicle.isVerified!);
                      return matchesStatus;
                      // return matchesName && matchesStatus;
                    }).toList();

                if (filteredList.isEmpty) {
                  return Center(child: Text("No vehicles found"));
                }

                return ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final vehicle = filteredList[index];
                    return RecentSales(
                      imagePath:
                          vehicle.images != null && vehicle.images!.isNotEmpty
                              ? vehicle.images![0]
                              : AppImages.carImage,
                      title: vehicle.name ?? "No Name",
                      name: vehicle.brand ?? "Unknown Brand",
                      date:
                          vehicle.createdAt != null
                              ? vehicle.createdAt!.toLocal().toString().split(
                                ' ',
                              )[0]
                              : "N/A",
                      imageBorderRadius: 5,
                      onTap: () {
                        if (vehicle.id != null) {
                          controller.fetchSingleVehicle(vehicle.id!);
                          Get.to(() => DealerCarDetailsScreen());
                        } else {
                          Get.snackbar("Error", "Owner ID not found");
                        }
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildShimmerBox() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 90,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
