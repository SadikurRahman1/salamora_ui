import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/features/garage/home/view/garage_home_screen.dart';

import '../../garage_profile/view/garage_profile_screen.dart';
import '../../garage_services/view/garage_services_screen.dart';

class OwnerNavbarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = [
    const GarageHomeScreen(),
    GarageServicesScreen(),
    GarageProfileScreen(),
  ];

  static final List<String> labels = [
    'home'.tr,
    'services'.tr,
    'profile'.tr,
  ];

  static List<Image> get activeIcons => [
    Image.asset(AppIcons.homeActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(
      AppIcons.serviceActive,
      height: res.hp(24),
      width: res.wp(24),
      color: AppColors.primaryColor,
    ),
    Image.asset(AppIcons.profileActive, height: res.hp(24), width: res.wp(24)),
  ];

  static List<Image> get inActiveIcons => [
    Image.asset(AppIcons.homeInactive, height: res.hp(24), width: res.wp(24)),
    Image.asset(
      AppIcons.serviceInactive,
      height: res.hp(24),
      width: res.wp(24),
    ),
    Image.asset(
      AppIcons.profileInactive,
      height: res.hp(24),
      width: res.wp(24),
    ),
  ];
}
