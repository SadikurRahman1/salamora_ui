import 'package:get/get.dart';
import 'package:selemara/features/buyer/buyer_nav_bar/controller/buyer_nav_bar_controller.dart';

class BuyerNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BuyerNavBarController());
  }
}