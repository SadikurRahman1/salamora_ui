import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../constants/app_responsive.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool? centerTitle;
  final bool? automaticallyImplyLeading;
  final PreferredSizeWidget? bottom;
  final double? leadingWidth;
  final Widget? leading;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.centerTitle = false,
    this.bottom,
    this.leadingWidth,
    this.leading,
    this.automaticallyImplyLeading,
  });

  @override
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return AppBar(
      leadingWidth: leadingWidth,
      automaticallyImplyLeading: automaticallyImplyLeading ?? false,
      forceMaterialTransparency: true,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Padding(padding: EdgeInsets.only(left: 10), child: leading),
      ),
      title: AppText(
        title,
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryTextColor,
      ),
      centerTitle: centerTitle,
      bottom: bottom,
    );
  }
}
