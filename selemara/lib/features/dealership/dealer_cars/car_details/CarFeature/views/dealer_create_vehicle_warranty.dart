import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../controller/vehicle_warranty_controller.dart';
import '../widgets/date_fild_card.dart';
import '../widgets/dual_input_row.dart';
import '../widgets/single_input_row.dart';
import '../widgets/text_and_dropdown_row.dart';

class DealerCreateVehicleWarranty extends StatelessWidget {
  DealerCreateVehicleWarranty({super.key});

  final VehicleWarrantyController controller =
      Get.find<VehicleWarrantyController>();

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "create_vehicle_warranty".tr,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(16)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: Card(
                color: AppColors.whitColor,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "vehicle_information".tr, // Vehicle Information
                        color: AppColors.textColor2A2A,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: res.hp(24)),
                      DualInputRow(
                        title1: "vehicle_name".tr,
                        subtitle1: "bmw",
                        title2: "color".tr,
                        subtitle2: "Black",
                        controller1: controller.coastController,
                        controller2: controller.emailController,
                      ),
                      SizedBox(height: res.hp(12)),
                      SingleInputField(
                        title: "vin_number".tr,
                        subtitle: "WBAFDHFIUGTFD",
                        controller: controller.vinNumberController,
                      ),
                      SizedBox(height: res.hp(12)),
                      SingleInputField(
                        title: "mileage".tr,
                        subtitle: "12331",
                        controller: controller.mileageController,
                      ),
                      SizedBox(height: res.hp(12)),
                      TextAndDropdownRow(
                        title1: "coast".tr,
                        subtitle1: "\$765",
                        controller1: controller.coastController,

                        title2: "duration".tr,
                        subtitle2: "select_duration".tr,
                        selectedValue: controller.selectedDuration,
                        dropdownItems: controller.durationList,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child: Card(
                color: AppColors.whitColor,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "customer_information".tr,
                        color: AppColors.textColor2A2A,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: res.hp(32)),
                      SingleInputField(
                        title: "customer_name".tr,
                        subtitle: "Your Name",
                        controller: controller.customerNameController,
                      ),
                      SizedBox(height: res.hp(12)),
                      SingleInputField(
                        title: "email".tr,
                        subtitle: "example@gmail.com",
                        controller: controller.emailController,
                      ),
                      SizedBox(height: res.hp(12)),
                      SingleInputField(
                        title: "phone_number".tr,
                        subtitle: "(555) 123-456",
                        controller: controller.phoneController,
                      ),
                      SizedBox(height: res.hp(12)),
                      DateFieldCard(
                        title: "purchase_date".tr,
                        subtitle: "DD/MM/YYYY",
                        controller: controller.purchaseDateController,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(25))),


            SliverToBoxAdapter(
              child: Card(
                color: AppColors.whitColor,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "customer_information".tr,
                        color: AppColors.textColor2A2A,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(height: res.hp(32)),

                      // 2-column layout: left & right
                      Row(
                        children: [
                          Expanded(
                            child: _buildCheckbox("Engine", controller.engine),
                          ),
                          Expanded(
                            child: _buildCheckbox(
                              "Transmission",
                              controller.transmission,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCheckbox(
                              "Electrical",
                              controller.electrical,
                            ),
                          ),
                          Expanded(
                            child: _buildCheckbox(
                              "Air-conditioning",
                              controller.airConditioning,
                            ),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCheckbox(
                              "Steering",
                              controller.steering,
                            ),
                          ),
                          Expanded(
                            child: _buildCheckbox("Brakes", controller.brakes),
                          ),
                        ],
                      ),
                      // SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            child: _buildCheckbox(
                              "Suspension",
                              controller.suspension,
                            ),
                          ),
                          Expanded(child: Container()),
                        ],
                      ),

                      CustomButton(
                        btnColor: AppColors.primaryColor.withAlpha(45),
                        textIconWidth: 0,
                        text: "add".tr,
                        onTap: () {},
                        textColor: AppColors.textColor626,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(36))),
            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      btnColor: Color(0xFFF5F5F5),
                      textIconWidth: 0,
                      text: "cancel".tr,
                      onTap: () {},
                      textColor: Color(0xFFACACAC),
                    ),
                  ),

                  SizedBox(width: res.wp(20)),
                  Expanded(
                    child: CustomButton(
                      btnColor: AppColors.primaryColor,
                      text: "create_warranty".tr,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.wp(62))),
          ],
        ),
      ),
    );
  }
}

Widget _buildCheckbox(String label, RxBool obs) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      Obx(
        () => Checkbox(
          value: obs.value,
          onChanged: (val) => obs.value = val!,
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.primaryColor;
            }
            return AppColors.geryColor;
          }),
        ),
      ),
      Text(label),
    ],
  );
}
