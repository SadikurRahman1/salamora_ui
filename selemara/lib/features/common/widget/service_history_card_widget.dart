import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class ServiceHistoryCardWidget extends StatelessWidget {
  final String title;
  final String date;
  final String serviceCenter;
  final String statusLabel;
  final bool color;
  final String invoiceLabel;
  final VoidCallback? onTapOilChange;
  final VoidCallback? onTapWarranty;
  final VoidCallback? onTapInvoice;

  const ServiceHistoryCardWidget({
    super.key,
    required this.title,
    required this.date,
    required this.serviceCenter,
    required this.statusLabel,
    required this.invoiceLabel,
    required this.color, this.onTapOilChange, this.onTapWarranty, this.onTapInvoice,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Container(
      padding: const EdgeInsets.all(16),
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      AppIcons.check1,
                      height: res.hp(24),
                      width: res.wp(24),
                    ),
                    SizedBox(width: res.wp(3)),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: onTapOilChange,
                                  child: AppText(
                                    title,
                                    color: AppColors.textColor2A2A,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 3,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                  color == true
                                      ? AppColors.greenColor
                                      : AppColors.orangeE6,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: AppText(
                                  date,
                                  color:
                                  color == true
                                      ? AppColors.whitColor
                                      : AppColors.orange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          AppText(
                            serviceCenter,
                            color: Color(0xFF45474e),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),

                          SizedBox(height: res.hp(6)),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: onTapWarranty,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppIcons.eye,
                                      height: res.hp(16),
                                      width: res.wp(16),
                                      color:
                                      color == true
                                          ? AppColors.greenColor
                                          : AppColors.primaryColor,
                                    ),
                                    SizedBox(width: res.wp(8)),
                                    AppText(
                                      statusLabel,
                                      color:
                                      color == true
                                          ? AppColors.greenColor
                                          : AppColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: onTapInvoice,
                                child: Row(
                                  children: [
                                    Image.asset(
                                      AppIcons.download,
                                      height: res.hp(16),
                                      width: res.wp(16),
                                    ),
                                    SizedBox(width: res.wp(8),),
                                    AppText(
                                      invoiceLabel,
                                      color: AppColors.primaryColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
