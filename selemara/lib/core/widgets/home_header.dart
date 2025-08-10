import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/widgets/app_text.dart';

class HomeHeader extends StatelessWidget {
  final String name;
  final String type;
  final String imagePath;
  final String notificationIconPath;
  final double imageSize;
  final double iconSize;

  const HomeHeader({
    super.key,
    required this.name,
    required this.type,
    required this.imagePath,
    required this.notificationIconPath,
    this.imageSize = 40,
    this.iconSize = 30,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(imagePath, width: imageSize, height: imageSize),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  name,
                  color: AppColors.textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                AppText(
                  type,
                  color: AppColors.textColor.withValues(alpha: 0.8),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ],
        ),
        Image.asset(notificationIconPath, width: iconSize, height: iconSize),
      ],
    );
  }
}
