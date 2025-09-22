import 'package:flutter/material.dart';
import 'package:selemara/core/constants/widget_extensions.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_images.dart';
import '../../../core/constants/app_responsive.dart';
import '../../../core/widgets/app_text.dart';

class ProfileHeader extends StatelessWidget {
  final String image;
  final String name;
  final String location;
  final VoidCallback onEdit;

  ProfileHeader({
    super.key,
    required this.image,
    required this.name,
    this.location = "",
    required this.onEdit,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                alignment: Alignment.topCenter,
                height: res.wp(80),
                width: res.wp(80),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  border: Border.all(
                    width: 7,
                    color: AppColors.profileBorderColor,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(res.wp(40)), // perfect circle
                  child: Image.asset(
                    image,
                    height: res.hp(80),
                    width: res.wp(80),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              /// Edit button
              Positioned(
                bottom: 10,
                right: 20,
                child: Image.asset(
                  AppImages.edit,
                  height: res.hp(32),
                  width: res.wp(32),
                  fit: BoxFit.cover,
                ).onTap(onEdit),
              ),
            ],
          ),

          /// Name & Location
          Column(
            children: [
              AppText(
                name,
                fontSize: res.sp(20),
                fontWeight: FontWeight.w600,
                color: AppColors.primaryTextColor,
              ),
              AppText(
                location,
                fontSize: res.sp(14),
                fontWeight: FontWeight.w400,
                color: AppColors.textColor7085,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
