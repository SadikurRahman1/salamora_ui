import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/features/garage/home/view/garage_home_screen.dart';

class OwnerNavbarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = const [
    GarageHomeScreen(),
    GarageHomeScreen(),
    Text("Home"),
    Text("Home"),

    // ProfileScreen(),
    // ProfileScreen(),
    // ProfileScreen(),
    // ProfileScreen(),
  ];

  static final List<String> labels = [
    'home'.tr,
    'services'.tr,
    'generate'.tr,
    'profile'.tr,
  ];

  static List<Image> get activeIcons => [
    Image.asset(AppIcons.homeActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.serviceActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.genearteActive, height: res.hp(24), width: res.wp(24)),
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
      AppIcons.genearteInActive,
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
