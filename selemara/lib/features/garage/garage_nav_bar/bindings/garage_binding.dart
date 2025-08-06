import 'package:get/get.dart';
import 'package:selemara/features/garage/garage_nav_bar/controller/garage_nav_bar_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>GarageNavBarController());
  }
}