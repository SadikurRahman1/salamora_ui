import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import '../../buyer_profile/view/buyer_profile_screen.dart';
import '../../buyer_saved/view/buyer_saved_car_screen.dart';
import '../../buyer_search/view/buyer_search_screen.dart';
import '../../home/views/buyer_home_screen.dart';

class BuyerNavBarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = [
    BuyerHomeScreen(),
    BuyerSearchScreen(),
    BuyerSavedCarScreen(),
    BuyerProfileScreen(),

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
    Image.asset(AppIcons.profileActive, height: res.hp(24), width: res.wp(24),),
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
