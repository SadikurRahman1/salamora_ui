import 'package:flutter/cupertino.dart';
import 'package:selemara/core/constants/api_urls.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class RecentSales extends StatelessWidget {
  RecentSales({
    super.key,
    required this.imagePath,
    required this.title,
    required this.name,
    required this.date,
    this.onTap,
    this.imageBorderRadius = 8,
  });

  final String imagePath;
  final String title;
  final String name;
  final String date;
  final double imageBorderRadius;
  final VoidCallback? onTap;

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: res.screenWidth,
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(imageBorderRadius),
              child: Image.network(
                ApiUrls.baseUrlForImage + imagePath,
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
            SizedBox(width: res.wp(12)),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: res.hp(10)),
                  Row(
                    children: [
                      Flexible(
                        child: AppText(
                          name,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor.withValues(alpha: 0.8),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
