import 'package:flutter/cupertino.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class CarInfoCard extends StatelessWidget {
  String? title;
  String? subTitle;
  String? carImage;

  CarInfoCard({super.key, this.title, this.subTitle, this.carImage});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                carImage ?? AppImages.carImage,
                height: res.hp(112),
                width: res.wp(213),
                fit: BoxFit.cover,
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 8, left: 8),
                child: Image.asset(
                  AppIcons.verified,
                  height: res.hp(20),
                  width: res.wp(77),
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
    );
  }
}
