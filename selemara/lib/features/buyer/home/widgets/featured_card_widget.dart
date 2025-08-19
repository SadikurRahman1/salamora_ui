import 'package:flutter/cupertino.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';


class FeaturedCard extends StatelessWidget {
  FeaturedCard({
    super.key,

    required this.imagePath,
    required this.title,
    required this.mileage,
    required this.date,
    required this.vin,
    required this.price,
    required this.sideIconPath,
    this.onTap,
    this.imageBorderRadius = 8,
  });


  final String imagePath;
  final String title;
  final String mileage;
  final String date;
  final String vin;
  final String price;
  final String sideIconPath;
  final double imageBorderRadius;
  final VoidCallback? onTap;


  final res = AppResponsive();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: res.screenWidth,
        // height: res.hp(90),
        margin: EdgeInsets.symmetric(vertical: 8),
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
              offset: const Offset(0, 2),
              blurRadius: 4,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Left image
            ClipRRect(
              borderRadius: BorderRadius.circular(imageBorderRadius),
              child: Image.asset(
                imagePath,
                width: res.wp(80),
                height: res.wp(72),
                fit: BoxFit.cover,
              ),
            ),

            // SizedBox(width: res.wp(8)),

            // Middle text section
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                SizedBox( height: res.hp(10),),
                Row(
                  children: [
                    AppText(
                      mileage,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor.withValues(alpha: 0.8),
                    ),
                    SizedBox(width: res.wp(5)),
                    Container(
                      width: res.wp(8),
                      height: res.wp(8),
                      decoration: BoxDecoration(
                        color: AppColors.textColor.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: res.wp(5)),
                    AppText(
                      date,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textColor.withValues(alpha: 0.8),
                    ),
                  ],
                ),
                SizedBox( height: res.hp(10),),
                AppText(
                  "VIN: $vin",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor.withValues(alpha: 0.8),
                ),
              ],
            ),

            // Right side icon + price
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.asset(
                    sideIconPath,
                    width: res.wp(30),
                    height: res.wp(30),
                    fit: BoxFit.cover,
                  ),
                ),
               SizedBox( height: res.hp(20),),
                AppText(
                  price,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
