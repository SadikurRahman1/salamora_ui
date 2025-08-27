import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class CarImageCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;
  final String miles;
  final String services;
  final String carColor;
  final String date;
  final String model;
  final VoidCallback onContactTap;
  final bool isPending;

  CarImageCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
    required this.miles,
    required this.services,
    required this.carColor,
    required this.date,
    required this.model,
    required this.onContactTap,
    required this.isPending,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(12),
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

              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    isPending ? AppIcons.pending : AppIcons.verified,
                    height: res.hp(24),
                    width: res.wp(89),
                  ),
                ),
              ),
            ],
          ),

          /// 🔹 Info Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                /// Title & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      title,
                      color: AppColors.textColor2A2A,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    AppText(
                       price,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor2A2A,
                    ),
                  ],
                ),

                SizedBox(height: res.hp(4)),

                /// Miles & Services
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppIcons.searchInActive, height: 16),
                        const SizedBox(width: 4),
                        AppText(
                          "$miles miles",
                          color: AppColors.textColor626,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(AppIcons.searchInActive, height: 16),
                        const SizedBox(width: 4),
                        AppText(
                          "$services Services",
                          color: AppColors.textColor626,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: res.hp(4)),

                /// Color & Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppIcons.searchInActive, height: 16),
                        const SizedBox(width: 4),
                        AppText(
                          carColor,
                          color: AppColors.textColor626,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Image.asset(AppIcons.searchInActive, height: 16),
                        const SizedBox(width: 4),
                        AppText(
                           date,
                          color: AppColors.textColor626,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: res.hp(4)),

                /// Model
                Row(
                  children: [
                    Image.asset(AppIcons.searchInActive, height: 16),
                    const SizedBox(width: 4),
                    AppText(
                       model,
                      color: AppColors.textColor626,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
