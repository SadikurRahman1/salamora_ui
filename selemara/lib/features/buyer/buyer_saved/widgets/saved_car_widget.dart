import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';
import 'package:selemara/core/widgets/custom_button.dart';

class SavedCarWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final String mileage;
  final String serviceCount;
  final String price;
  final VoidCallback onContactTap;

  SavedCarWidget({
    super.key,
    required this.imagePath,
    required this.title,
    required this.mileage,
    required this.serviceCount,
    required this.price,
    required this.onContactTap,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 4.0,
            spreadRadius: 0.5,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(
                  imagePath,
                  height: res.hp(198),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              // Top-left button
              Positioned(
                top: 12,
                left: 12,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppIcons.verified,
                      height: res.hp(24),
                      width: res.hp(89),
                    ),
                  ),
                ),
              ),

              // Top-right button
              Positioned(
                top: 12,
                right: 12,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      AppIcons.saveInActive,
                      height: res.hp(16),
                      width: res.hp(16),
                      color: AppColors.whitColor,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            title,
                            color: AppColors.textColor2A2A,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              AppText(
                                mileage,
                                color: AppColors.textColor626,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              const SizedBox(width: 8),
                              Container(
                                height: res.wp(8),
                                width: res.wp(8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.bordarColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              AppText(
                                serviceCount,
                                color: AppColors.textColor626,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    AppText(
                      price,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                CustomButton(text: "contact_now".tr, onTap: onContactTap),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
