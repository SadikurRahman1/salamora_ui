import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class GarageFeatureCard extends StatelessWidget {
  final Color sideColor;
  final String cardText;
  const GarageFeatureCard({
    super.key,
    required this.res,
    required this.sideColor,
    required this.cardText,
  });

  final AppResponsive res;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: res.wp(160),
      child: Stack(
        children: [
          Container(
            width: res.wp(20),
            height: res.isTablet ? res.hp(100) : res.hp(70),
            decoration: BoxDecoration(
              color: sideColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(res.sp(15)),
                bottomLeft: Radius.circular(res.sp(15)),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 5,
            right: 0,
            child: Container(
              // width: res.wp(100),
              height: res.isTablet ? res.hp(100) : res.hp(70),
              padding: EdgeInsets.symmetric(
                horizontal: res.hp(10),
                vertical: res.wp(10),
              ),
              decoration: BoxDecoration(
                color: AppColors.whitColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(res.sp(15)),
                  bottomLeft: Radius.circular(res.sp(15)),
                  topRight: Radius.circular(res.sp(15)),
                  bottomRight: Radius.circular(res.sp(15)),
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                    offset: Offset(0, 5),
                    blurRadius: 10,
                    spreadRadius: 3,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        cardText,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textColor.withValues(alpha: 0.8),
                      ),
                      AppText(
                        "2",
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor.withValues(alpha: 0.8),
                      ),
                    ],
                  ),
                  Image.asset(
                    AppIcons.car,
                    width: res.wp(35),
                    height: res.hp(35),
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
