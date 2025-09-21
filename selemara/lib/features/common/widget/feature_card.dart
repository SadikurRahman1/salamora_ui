import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class FeatureCard extends StatelessWidget {
  final Color sideColor;
  final String title;
  final String value;
  final String? icon;
  final VoidCallback? onTap; // Optional tap callback

  FeatureCard({
    super.key,
    required this.sideColor,
    required this.title,
    required this.value,
    this.icon,
    this.onTap,
  });

  final res = AppResponsive();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: res.wp(160),
        child: Stack(
          children: [
            // Colored side bar
            // Positioned(
            //   left: 0,
            //   top: 0,
            //   bottom: 0,
            //   child: Container(
            //     width: res.wp(20),
            //     decoration: BoxDecoration(
            //       color: sideColor,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(res.sp(15)),
            //         bottomLeft: Radius.circular(res.sp(15)),
            //       ),
            //     ),
            //   ),
            // ),

            // Main card
            Container(
              margin: EdgeInsets.only(left: res.wp(5)),
              padding: EdgeInsets.symmetric(
                horizontal: res.hp(10),
                vertical: res.wp(10),
              ),
              decoration: BoxDecoration(
                color: AppColors.whitColor,
                borderRadius: BorderRadius.circular(res.sp(15)),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    offset: const Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text Column
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AppText(
                        title,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor.withValues(alpha: 0.8),
                      ),
                      SizedBox(height: res.hp(5)),
                      AppText(
                        value,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor.withValues(alpha: 0.8),
                      ),
                    ],
                  ),

                  // Icon
                  if (icon != null)
                    Image.asset(
                      icon!,
                      width: res.wp(35),
                      height: res.hp(35),
                      fit: BoxFit.contain,
                    )
                  else
                    Image.asset(
                      AppIcons.car,
                      width: res.wp(35),
                      height: res.hp(35),
                      fit: BoxFit.contain,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
