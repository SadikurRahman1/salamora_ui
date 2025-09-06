import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/features/buyer/buyer_search/controller/buyer_search_controller.dart';
import 'package:selemara/features/buyer/common/widgets/activity_card_widget.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import 'buyer_scanner_screen.dart';

class BuyerSearchScreen extends StatelessWidget {
  BuyerSearchScreen({super.key});

  final res = AppResponsive();
  final BuyerSearchController controller = Get.put(BuyerSearchController());

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: res.hp(0)),
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.all(20),
                      alignment: Alignment.center,
                      height: res.wp(64),
                      width: res.wp(64),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primaryColor.withValues(alpha: 0.1),
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
              ),
              CustomButton(
                text: "scan_now".tr,
                btnColor: AppColors.orange,
                borderRadius: 8,
                onTap: () {
                  Get.to(()=> ScannerScreen());
                },
              ),
              SizedBox(height: res.hp(12)),
              SizedBox(
                width: double.infinity,
                child: AppText(
                  "or".tr,
                  textAlign: TextAlign.center,
                  fontSize: res.sp(16),
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ),
              SizedBox(height: res.hp(12)),
              CustomTextFormField(
                borderRadius: 8,
                hintText:   "enter_vin_manually".tr,
                controller: controller.searchTEController,
                onChanged: (value){
                  controller.setVinInput(value);
                },

              ),
              SizedBox(height: res.hp(12)),
              Obx(() {
                bool isEmpty = controller.vinInput.isEmpty;
                  return CustomButton(
                    text: "search".tr,
                    textColor: isEmpty ? AppColors.textColor.withValues(alpha: 0.4) : AppColors.whitColor,
                    iconPath: isEmpty ? AppIcons.searchInActive:AppIcons.searchActive,
                    iconColor: isEmpty ? AppColors.textColor.withValues(alpha: 0.4) : AppColors.whitColor,
                    btnColor:isEmpty? AppColors.primaryColor.withValues(alpha: 0.1):AppColors.primaryColor,
                    fontSize: 16,
                    isLoading: controller.isLoading.value,
                    onTap: () {
                      if(!isEmpty){
                       controller.getVinSearchResult();
                       controller.fetchServiceHistory();
                      }
                    },
                  );


              }),
              SizedBox(height: res.hp(32)),
              AppText(
                "recent_search".tr,
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: res.hp(20)),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: res.hp(12)),
                    child: ActiveCard(
                      imagePath: AppIcons.model,
                      title: "Scanned Toyota Camry 2020",
                      subtitle: "4 Service History Verified",
                    ),
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
