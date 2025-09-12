import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/widget_extensions.dart';

import '../../../../core/constants/api_urls.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class DealerMyCarsCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final String carImagePath;
  final VoidCallback? onTap;
  final bool isVerified;


  DealerMyCarsCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.carImagePath,
    this.onTap,
    required this.isVerified,
  });

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
                    carImagePath,
                    width: res.wp(80),
                    height: res.wp(72),
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      // যদি image load না হয়
                      return Container(
                        width: res.wp(80),
                        height: res.wp(72),
                        color: AppColors.textColor.withValues(alpha: 0.1),
                        child: Icon(
                          CupertinoIcons.photo,
                          size: res.wp(40),
                          color: AppColors.textColor.withValues(alpha: 0.3),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Image.asset(
                  isVerified ? AppIcons.unverified : AppIcons.verified,
                  height: res.hp(16),
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
                        title ?? "----",
                        color: AppColors.textColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(height: 4),
                      AppText(
                       "VIN :${subTitle ?? "VIN: ---"}",
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
      ).onTap(onTap),
    );
  }
}
