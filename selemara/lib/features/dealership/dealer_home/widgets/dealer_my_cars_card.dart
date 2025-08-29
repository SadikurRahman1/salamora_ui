import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class DealerMyCarsCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? carImagePath; // String path নেওয়া হলো

  DealerMyCarsCard({super.key, this.title, this.subTitle, this.carImagePath});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 213,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 112,
                width: 213,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    carImagePath ?? "assets/images/default_car.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              // Left top badge
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        AppIcons.verified1,
                        height: res.hp(12),
                        width: res.wp(12),
                      ),
                      SizedBox(width: res.wp(2)),
                      AppText(
                        "verified".tr,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: res.wp(213),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        title ?? "2018 Honda Civic",
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      AppText(
                        subTitle ?? "VIN: IHGCV2F6JLOOOOOO",
                        color: AppColors.textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: res.wp(5)),
                  child: Image.asset(
                    AppIcons.qrCode,
                    height: res.hp(16),
                    width: res.wp(16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}