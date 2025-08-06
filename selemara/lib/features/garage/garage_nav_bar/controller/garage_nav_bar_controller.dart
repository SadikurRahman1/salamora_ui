import 'package:get/get.dart';
import 'package:selemara/features/garage/garage_nav_bar/widget/owner_nav_bar_items.dart';

import '../../../../core/constants/app_responsive.dart';

class GarageNavBarController extends GetxController {
  static var res = AppResponsive();

  final RxInt _selectedIndex = 0.obs;

  RxInt get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index >= 0 && index < OwnerNavbarItems.screens.length) {
      _selectedIndex.value = index;
    }
  }
}
