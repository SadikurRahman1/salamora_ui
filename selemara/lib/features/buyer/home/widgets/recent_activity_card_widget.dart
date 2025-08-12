import 'package:flutter/cupertino.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class RecentActiveCard extends StatelessWidget {
  RecentActiveCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
    this.borderRadius = 8,
    this.onTap,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final double borderRadius;
  final VoidCallback? onTap;

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: res.hp(10),
          vertical: res.wp(10),
        ),
        decoration: BoxDecoration(
          color: AppColors.whitColor,
          borderRadius: BorderRadius.circular(res.sp(8)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withValues(alpha: 0.2),
              // offset: const Offset(0, 2),
              blurRadius: 1,
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: Image.asset(
                imagePath,
                width: res.wp(25),
                height: res.wp(25),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: res.wp(16)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  title,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textColor,
                ),
                SizedBox(height: res.hp(5)),
                AppText(
                  subtitle,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColor.withValues(alpha: 0.8),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
