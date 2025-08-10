import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget? child;

  const BackgroundGradient({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: AppColors.whitColor,
          // gradient: LinearGradient(
          //   colors: [
          //     Color(0xFF2563EB).withValues(alpha: 0.2),
          //     Color(0xFF00A16E).withValues(alpha: 0.3), // green
          //   ],
          //   stops: [0.0, 1.0],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomLeft,
          // ),
        ),
        child: child,
      ),
    );
  }
}
