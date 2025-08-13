import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class ProfileCard extends StatelessWidget {
  final res = AppResponsive();

 final String? title;
 final String? subTitle;
 final String? textStatus;
 final Color? textColor;
 final Color? boxColor;


  ProfileCard({super.key, this.title, this.subTitle, this.textColor, this.boxColor, this.textStatus});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: res.wp(100),
      // height: res.hp(70),
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
            offset: Offset(0, 2),
            blurRadius: 4,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: Container(
                  width: res.wp(8),
                  height: res.wp(8),
                  decoration: BoxDecoration(
                    color: AppColors.greenColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              SizedBox(width: res.wp(5)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                   title?? "Ahmed Al Mansouri",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                  ),
                  SizedBox(height: res.hp(5)),
                  AppText(
                   subTitle?? "Toyota Camry - Al Futtaim Service",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor.withValues(alpha: 0.8),
                  ),
                ],
              ),
            ],
          ),

          // SizedBox(width: res.hp(20)),
          Container(
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color:boxColor?? AppColors.yallowColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(res.sp(20)),
            ),
            child: AppText(
             textStatus?? "Pending",
              color:textColor?? AppColors.yallowColor,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
