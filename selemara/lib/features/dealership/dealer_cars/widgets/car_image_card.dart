import 'package:flutter/material.dart';
import 'package:selemara/core/constants/api_urls.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_images.dart';

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
  final bool isVerified;

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
    required this.isVerified,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whitColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          /// 🔹 Car Image + Status
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: Image.network(
                  ApiUrls.baseUrlForImage + imagePath,
                  height: res.hp(198),
                  width: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            (loadingProgress.expectedTotalBytes ?? 1)
                            : null,
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      AppImages.carImage, // fallback asset image
                      height: res.hp(198),
                      width: double.infinity,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Positioned(
                top: 12,
                left: 12,
                child: Image.asset(
                  isVerified ? AppIcons.verified : AppIcons.unverified,
                  height: res.hp(28),
                ),
              ),
            ],
          ),

          /// 🔹 Info Section
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title & Price
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: AppText(
                        title,
                        color: AppColors.textColor2A2A,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(width: res.wp(8)),
                    AppText(
                      price,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor2A2A,
                    ),
                  ],
                ),

                SizedBox(height: res.hp(6)),

                /// Miles & Services
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoRow(icon: AppIcons.mitter, text: "$miles miles"),
                    InfoRow(icon: AppIcons.service, text: "$services Services"),
                  ],
                ),

                SizedBox(height: res.hp(6)),

                /// Color & Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InfoRow(icon: AppIcons.color, text: carColor),
                    InfoRow(icon: AppIcons.calendar, text: date),
                  ],
                ),

                SizedBox(height: res.hp(6)),

                /// Model
                InfoRow(icon: AppIcons.car1, text: model),

                SizedBox(height: res.hp(24)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// 🔹 Reusable Row Widget
class InfoRow extends StatelessWidget {
  final String icon;
  final String text;

  const InfoRow({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(icon, height: 16),
        const SizedBox(width: 4),
        AppText(
          text,
          color: AppColors.textColor626,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
