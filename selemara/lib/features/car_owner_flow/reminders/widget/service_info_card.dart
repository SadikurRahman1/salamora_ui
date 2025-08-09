import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class ServiceInfoCard extends StatelessWidget {
  final String title;
  final String status;
  final String count;


  final String dueDate;
  final Color statusBgColor;
  final Color statusTextColor;
  final Color sideBarColor;

  // Inject your responsive helper here or pass context and create it inside
  final res = AppResponsive();

  ServiceInfoCard({
    super.key,
    required this.title,
    required this.status,
    required this.count,
    required this.dueDate,
    required this.statusBgColor,
    required this.statusTextColor,
    required this.sideBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: res.wp(160),
      child: Stack(
        children: [
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              width: res.wp(20),
              decoration: BoxDecoration(
                color: sideBarColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(res.sp(15)),
                  bottomLeft: Radius.circular(res.sp(15)),
                ),
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.only(left: res.wp(5)),
            padding: EdgeInsets.symmetric(
              horizontal: res.hp(16),
              vertical: res.wp(16),
            ),
            decoration: BoxDecoration(
              color: AppColors.whitColor,
              borderRadius: BorderRadius.circular(res.sp(15)),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withValues(alpha: 0.1),
                  offset: const Offset(0, 1),
                  blurRadius: 20,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: AppText(
                        title,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.textColor2A2A,
                      ),
                    ),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: AppText(
                        status,
                        color: statusTextColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: res.hp(4)),
                AppText(
                  count,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textColorD82,
                ),
                SizedBox(height: res.hp(8)),

                AppText(
                  "Due: $dueDate",
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: sideBarColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
