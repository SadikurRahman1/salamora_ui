import 'package:get/get.dart';
import '../../../buyer/buyer_profile/controller/buyer_profile_controller.dart';
import '../controller/dealer_nav_bar_controller.dart';


class DealerNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>DealerNavBarController());
    Get.lazyPut(()=>BuyerProfileController());
  }
}