import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_responsive.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/widgets/app_text.dart';

class CarDetailCard extends StatelessWidget {
  final String imagePath;
  final String carName;
  final String colorName;
  final String mileage;
  final String vin;
  final String lastService;
  final String nextService;
  final String serviceRecords;
  final String documents;
  final VoidCallback? onIconTap;

  const CarDetailCard({
    super.key,
    required this.imagePath,
    required this.carName,
    required this.colorName,
    required this.mileage,
    required this.vin,
    required this.lastService,
    required this.nextService,
    required this.serviceRecords,
    required this.documents,
    this.onIconTap,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4.0,
            spreadRadius: 0.5,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(AppImages.carImage, fit: BoxFit.cover),
          ),
          Padding(padding: EdgeInsets.only(top: 20)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "car_2020_honda_civic".tr,
                      color: AppColors.textColor2A2A,
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                    Padding(padding: EdgeInsets.only(top: 4)),
                    Row(
                      children: [
                        AppText(
                          "color_silver".tr,
                          color: AppColors.textColor626,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        Container(
                          height: res.wp(8),
                          width: res.wp(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.bordarColor,
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left: 8)),
                        AppText(
                          "mileage_45000_miles".tr,
                          color: AppColors.textColor626,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: const Color(0xFFe6f6f1),
                    borderRadius: BorderRadius.circular(res.sp(4)),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x1AF0F4FD),
                        blurRadius: 3.0,
                        spreadRadius: 1.0,
                        offset: const Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(res.sp(4)),
                    child: Image.asset(
                      AppIcons.model,
                      height: res.hp(32),
                      width: res.wp(32),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 16)),
          _labelValueRow("vin".tr, "CV2F6JLOOOOOO",context),
          Padding(padding: EdgeInsets.only(top: 8)),
          _labelValueRow("last_service".tr, "1/15/2024",context),
          Padding(padding: EdgeInsets.only(top: 8)),
          _labelValueRow("next_service".tr, "4/15/2024",context),
          Padding(padding: EdgeInsets.only(top: 8)),
          _labelValueRow("service_records".tr, "8",context),
          Padding(padding: EdgeInsets.only(top: 8)),
          _labelValueRow("documents".tr, "2 ${"uploaded".tr}",context),
        ],
      ),
    );
  }

  Row _labelValueRow(String key, String value, BuildContext context) {
    return Row(
      textDirection: Directionality.of(context), // ✅ Auto detect locale (LTR/RTL)
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Align(
            alignment: AlignmentDirectional.topStart, // ✅ RTL/LTR aware
            child: AppText(
              key,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Align(
            alignment: AlignmentDirectional.topEnd, // ✅ RTL/LTR aware
            child: AppText(
              value,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
