import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class VehicleDocumentCard extends StatelessWidget {
  final String policyTitle;
  final String insuranceType;
  final String startDate;
  final String expiryDate;
  final VoidCallback onDelete;

  const VehicleDocumentCard({
    super.key,
    required this.policyTitle,
    required this.insuranceType,
    required this.startDate,
    required this.expiryDate,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Color(0xFFf4f7fe),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  policyTitle,
                  color: AppColors.primaryColor1,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    AppText(
                      insuranceType,
                      color: AppColors.textColor626,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: res.wp(4)),
                    Container(
                      height: res.wp(6),
                      width: res.wp(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.bordarColor,
                      ),
                    ),
                    SizedBox(width: res.wp(4)),
                    AppText(
                      startDate,
                      color: AppColors.textColor626,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: res.wp(4)),
                    Container(
                      height: res.wp(6),
                      width: res.wp(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.bordarColor,
                      ),
                    ),
                    SizedBox(width: res.wp(4)),
                    Flexible(
                      child: AppText(
                        "Expires $expiryDate",
                        color: AppColors.textColor626,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onDelete,
            child: Image.asset(
              AppIcons.delete,
              height: res.hp(16),
              width: res.wp(16),
            ),
          ),
        ],
      ),
    );
  }
}
