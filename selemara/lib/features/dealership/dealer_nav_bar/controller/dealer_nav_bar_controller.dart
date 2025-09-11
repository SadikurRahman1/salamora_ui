import 'package:get/get.dart';
import '../../../../core/constants/app_responsive.dart';
import '../widget/dealer_nav_bar_items.dart';

class DealerNavBarController extends GetxController {
  static var res = AppResponsive();

  final RxInt _selectedIndex = 0.obs;

  RxInt get currentIndex => _selectedIndex;

  void changeIndex(int index) {
    if (index >= 0 && index < DealerNavBarItems.screens.length) {
      _selectedIndex.value = index;
    }
  }
}
