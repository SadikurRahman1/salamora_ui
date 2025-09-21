import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';

class CBanner extends StatelessWidget {
  CBanner({
    super.key,
    required this.child,
    this.color,
  });

  final Widget child;
  final Color? color;


  final res =AppResponsive();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: res.screenWidth,
      padding: EdgeInsets.symmetric(
        horizontal: res.wp(16),
        vertical: res.hp(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(res.sp(16)),
        color: color ?? AppColors.primaryColor,
        // gradient: LinearGradient(
        //   colors: [
        //     Color(0xFF00A16E).withValues(alpha: 0.3),
        //     Color(0xFF2563EB).withValues(alpha: 0.5),
        //   ],
        // ),
      ),
      child: child,
    );
  }
}
