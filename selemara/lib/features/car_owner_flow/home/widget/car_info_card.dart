import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class CarInfoCard extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final String? carImage;
  final bool isCheck;

  CarInfoCard({
    super.key,
    this.title,
    this.subTitle,
    this.carImage,
    this.isCheck = false,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(
                carImage!,
                height: res.hp(112),
                width: res.wp(213),
                fit: BoxFit.cover,
              ),
            ),

            // Image.network(
            //   carImage ??
            //       'https://www.quranspirit.com/wp-content/uploads/2021/12/Rules-of-reading-Quran-1024x1024.jpg',
            //   fit: BoxFit.cover,
            //   width: double.infinity,
            //   height: double.infinity,
            //   errorBuilder: (context, error, stackTrace) {
            //     return Image.asset(AppIcons.activeWarr, fit: BoxFit.cover);
            //   },
            // ),

            /// Left top badge
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
                      title ?? "2018 Honda Civic2018",
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

              !isCheck
                  ? Padding(
                    padding: EdgeInsets.only(top: res.wp(5)),
                    child: Image.asset(
                      AppIcons.qrCode,
                      height: res.hp(16),
                      width: res.wp(16),
                    ),
                  )
                  : SizedBox(),
            ],
          ),
        ),
      ],
    );
  }
}
