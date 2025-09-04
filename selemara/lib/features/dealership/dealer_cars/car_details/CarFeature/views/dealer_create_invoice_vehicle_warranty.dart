import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../controller/create_vehicle_invoice_warranty_controller.dart';
import '../widgets/date_fild_card.dart';
import '../widgets/dual_input_row.dart';
import '../widgets/single_input_row.dart';
import '../widgets/text_and_dropdown_row.dart';

class DealerCreateInvoiceVehicleWarranty extends StatelessWidget {
  DealerCreateInvoiceVehicleWarranty({super.key});

  final CreateVehicleInvoiceWarrantyController controller =
      Get.find<CreateVehicleInvoiceWarrantyController>();

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
                        "vehicle_information".tr,
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
                        controller1: controller.saleController,
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
                        title1: "sel_price (\$)".tr,
                        subtitle1: "\$765",
                        controller1: controller.saleController,

                        title2: "Payment".tr,
                        subtitle2: "payment_method".tr,
                        selectedValue: controller.selectPayment,
                        dropdownItems: controller.paymentList,
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
                      btnColor: AppColors.primaryColor1,
                      text: "create_invoice".tr,
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
