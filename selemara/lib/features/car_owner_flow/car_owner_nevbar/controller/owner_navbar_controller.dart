import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/features/car_owner_flow/profile/view/profile_screen.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../home/view/home_screen_owner.dart';


class OwnerNavbarController extends GetxController {
  static late var res=AppResponsive() ;

  final _selectedIndex = 0.obs;

  int get currentIndex => _selectedIndex.value;

  void changeIndex(int index) {
    if (index >= 0 && index < screens.length) {
      _selectedIndex.value = index;
    }
  }

  final List<Widget> screens = [
    HomeScreenOwner(),
    ProfileScreen(),
    ProfileScreen(),

    ProfileScreen(),
  ];

  final List<String> labels = const ['Home', 'Services', 'Reminders', "Profile"];

  final List<Image> activeIcons = [
    Image.asset(AppIcons.homeActive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.serviceActive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.reminderActive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.profileActive, height:res.hp(24) , width:res.wp(24)),
  ];

  final List<Image> inActiveIcons = [
    Image.asset(AppIcons.homeInactive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.serviceInactive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.remindersInactive, height:res.hp(24) , width:res.wp(24)),
    Image.asset(AppIcons.profileInactive, height:res.hp(24) , width:res.wp(24)),
  ];





  @override
  void onInit() {
    super.onInit();
   res=AppResponsive();



}



}
