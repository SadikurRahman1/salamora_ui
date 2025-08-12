import 'package:get/get.dart';
import 'package:selemara/features/buyer/buyer_nav_bar/controller/buyer_nav_bar_controller.dart';
import 'package:selemara/features/garage/garage_nav_bar/controller/garage_nav_bar_controller.dart';

class BuyerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BuyerNavBarController());
  }
}