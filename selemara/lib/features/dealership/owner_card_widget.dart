import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/constants/widget_extensions.dart';

import '../../core/widgets/app_text.dart';

class OwnerCard extends StatelessWidget {
  final String name;
  final String date;
  final String miles;
  final String status;
  final bool isCurrent;
  final VoidCallback? ontap;

  const OwnerCard({
    super.key,
    required this.name,
    required this.date,
    required this.miles,
    required this.status,
    this.isCurrent = false,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isCurrent ? Colors.green.shade50 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left avatar
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blue.shade100,
            child: Icon(Icons.person, color: Colors.blue),
          ),
          SizedBox(width: res.wp(10)),

          // Right content (name + status, date + miles)
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // First row (Name + Status)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      name,
                      color: AppColors.textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color:
                            isCurrent
                                ? AppColors.greenColor
                                : AppColors.primaryColor.withAlpha(40),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: AppText(
                        status,

                        color:
                            isCurrent
                                ? AppColors.whitColor
                                : AppColors.primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(6)),

                // Second row (Date + Miles)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 12,
                          color: AppColors.geryColor,
                        ),
                        SizedBox(width: 4),
                        AppText(
                          date,
                          fontSize: 12,
                          color: AppColors.textColor2B2B,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.directions_car,
                          size: 12,
                          color: AppColors.geryColor,
                        ),
                        SizedBox(width: 4),
                        AppText(
                          miles,
                          fontSize: 12,
                          color: AppColors.textColor2B2B,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ).onTap(ontap);
  }
}
