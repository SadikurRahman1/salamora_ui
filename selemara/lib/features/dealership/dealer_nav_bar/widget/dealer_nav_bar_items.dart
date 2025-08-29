import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/features/buyer/buyer_profile/view/buyer_profile_screen.dart';

import '../../dealer_cars/views/dealer_car_search_screen.dart';
import '../../dealer_home/views/dealer_home_screen.dart';


class DealerNavBarItems {
  static final res = AppResponsive();

  static final List<Widget> screens = [
    DealerHomeScreen(),
    DealerCarSearchScreen(),
    BuyerProfileScreen()

  ];

  static final List<String> labels = [
    'home'.tr,
    'car'.tr,
    'profile'.tr,
  ];

  static List<Image> get activeIcons => [
    Image.asset(AppIcons.homeActive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.carActive, height: res.hp(24), width: res.wp(24),color: AppColors.primaryColor1),
    Image.asset(AppIcons.profileActive, height: res.hp(24), width: res.wp(24)),
  ];

  static List<Image> get inActiveIcons => [
    Image.asset(AppIcons.homeInactive, height: res.hp(24), width: res.wp(24)),
    Image.asset(AppIcons.carInActive, height: res.hp(24), width: res.wp(24),),
    Image.asset(
      AppIcons.profileInactive,
      height: res.hp(24),
      width: res.wp(24),
    ),
  ];
}
