import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';


class DealerNavBarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = [
    // BuyerHomeScreen(),
    // BuyerSearchScreen(),
    // BuyerSavedCarScreen(),
    // BuyerProfileScreen(),
    Text('1'),
    Text('1'),
    Text('1'),
    Text('1'),

  ];

  static final List<String> labels = [
    'home'.tr,
    'search'.tr,
    'saved'.tr,
    'profile'.tr,
  ];

  static List<Image> get activeIcons => [
    Image.asset(AppIcons.homeActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.genearteActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.saveActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.profileActive, height: res.hp(24), width: res.wp(24)),
  ];

  static List<Image> get inActiveIcons => [
    Image.asset(AppIcons.homeInactive, height: res.hp(24), width: res.wp(24)),
    Image.asset(
      AppIcons.genearteInActive,
      height: res.hp(24),
      width: res.wp(24),
    ),
    Image.asset(AppIcons.saveInActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(
      AppIcons.profileInactive,
      height: res.hp(24),
      width: res.wp(24),
    ),
  ];
}
