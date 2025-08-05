import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';

class OwnerNavbarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = const [
    Text("Home"),
    Text("Home"),
    Text("Home"),
    Text("Home"),

    // ProfileScreen(),
    // ProfileScreen(),
    // ProfileScreen(),
    // ProfileScreen(),
  ];

  static final List<String> labels = [
    'Home',
    'Services',
    'Generate',
    'Profile',
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
