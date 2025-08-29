import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
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
        leading: Icon(Icons.arrow_back, size: res.wp(24)),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: res.wp(20)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: 10,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return RecentSales(
                    imagePath: AppImages.carImage,
                    title: "2020 Toyota Camry",
                    name: "Ahmed Al Mansouri",
                    date: "1/15/2024",
                    imageBorderRadius: 5,
                    onTap: () {
                      Get.to(()=>DealerCarDetailsScreen());
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
