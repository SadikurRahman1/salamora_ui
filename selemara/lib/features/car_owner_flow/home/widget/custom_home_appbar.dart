import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../core/constants/app_responsive.dart';

class CustomHomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  CustomHomeAppbar({super.key});

  final res = AppResponsive();

  @override
  Size get preferredSize => const Size.fromHeight(56); // appbar height

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: res.hp(48),
                  width: res.wp(48),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(AppIcons.profileHome),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                SizedBox(width: res.wp(8)),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      "John Doe",

                      color: AppColors.textColor2A2A,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),

                    AppText(
                      "Car Owner",

                      color: AppColors.textColor626,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(
              height: res.hp(32),

              width: res.wp(32),
              child: Image.asset(AppIcons.notificationIcon),
            ),
          ],
        ),
      ),
    );
  }
}
