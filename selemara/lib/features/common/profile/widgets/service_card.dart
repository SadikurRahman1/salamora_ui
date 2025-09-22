import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/constants/app_responsive.dart';

class ServicePriceCard extends StatelessWidget {
  final String title;
  final String price;
  final VoidCallback? onTap;
  final Color? backgroundColor;
  final TextStyle? titleStyle;
  final TextStyle? priceStyle;

  ServicePriceCard({
    super.key,
    required this.title,
    required this.price,
    this.onTap,
    this.backgroundColor,
    this.titleStyle,
    this.priceStyle,
  });


  final res = AppResponsive();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? AppColors.whitColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              title,
              fontSize: titleStyle?.fontSize ?? res.sp(16),
              fontWeight: titleStyle?.fontWeight ?? FontWeight.w400,
              color: titleStyle?.color ?? AppColors.primaryTextColor,
            ),
            AppText(
              price,
              fontSize: priceStyle?.fontSize ?? res.sp(16),
              fontWeight: priceStyle?.fontWeight ?? FontWeight.w400,
              color: priceStyle?.color ?? AppColors.primaryTextColor,
            ),
          ],
        ),
      ),
    ).onTap(onTap);
  }
}
