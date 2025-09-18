import 'package:flutter/material.dart';
import '../../../../../../../core/constants/app_colors.dart';
import '../../../../../../../core/constants/app_responsive.dart';
import '../../../../../../../core/widgets/app_text.dart';
import '../../../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../controller/dealer_car_controller.dart';
import '../controller/sell_vehicle_controller.dart';
import '../widgets/date_fild_card.dart';
import '../widgets/single_dropdown_btn.dart';
import '../widgets/single_input_row.dart';


class SellVehicleScreen extends StatelessWidget {
  const SellVehicleScreen({super.key});

  @override
  Widget build(BuildContext context) {

    SellVehicleController controller = Get.find();
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "sell_vehicle".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body:  SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(height: res.hp(24)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

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
              // SingleDropdownBtn(
              //   title2: "buyer_name".tr,
              //   subtitle2: "buyer_name".tr,
              //   selectedValue: controller.selectName,
              //   dropdownItems: controller.nameList,
              // ),
              SingleInputField(
                title: 'buyer_name'.tr,
                subtitle: 'search_name.....'.tr,
                controller: controller.price,
                onChanged: (value){
                  controller.setVinInput(value);
                },
              ),
              SizedBox(height: res.hp(16)),

              SingleInputField(
                title: 'price'.tr,
                subtitle: '10000'.tr,
                controller: controller.price,
              ),

              SizedBox(height: res.hp(16)),

              DateFieldCard(
                title: "exp_date".tr,
                subtitle: "DD/MM/YYYY",
                controller: controller.expDate,
              ),

              SizedBox(height: res.hp(43)),

              CustomButton(
                text: "sell_vehicle".tr,
                btnColor: AppColors.primaryColor,
                onTap: () {
                  controller.click();
                },
              ),

            ],
          ),
        ),
      )
    );
  }


}
