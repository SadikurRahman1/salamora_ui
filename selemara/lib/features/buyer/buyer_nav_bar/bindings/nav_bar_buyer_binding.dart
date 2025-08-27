import 'package:get/get.dart';
import 'package:selemara/features/buyer/buyer_nav_bar/controller/buyer_nav_bar_controller.dart';
import 'package:selemara/features/buyer/buyer_profile/controller/buyer_profile_controller.dart';
import 'package:selemara/features/car_owner_flow/profile/controller/profile_controller.dart';

class BuyerNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>BuyerNavBarController());
    Get.lazyPut(()=>BuyerProfileController());
  }
}