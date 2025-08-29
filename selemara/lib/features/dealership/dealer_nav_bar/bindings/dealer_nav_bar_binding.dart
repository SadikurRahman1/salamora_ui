import 'package:get/get.dart';
import '../../../buyer/buyer_profile/controller/buyer_profile_controller.dart';
import '../../dealer_cars/car_details/CarFeature/controller/vehicle_warranty_controller.dart';
import '../../dealer_cars/controller/dealer_service_history_controller.dart';
import '../../dealer_home/controller/dealer_add_vehicle_controller.dart';
import '../../dealer_home/controller/dealer_request_service_controller.dart';
import '../controller/dealer_nav_bar_controller.dart';


class DealerNavBarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(()=>DealerNavBarController());
    Get.lazyPut(()=>BuyerProfileController());
    Get.lazyPut(()=>DealerAddVehicleController());
    Get.lazyPut(()=>DealerRequestServiceController(), fenix: true);
    Get.lazyPut(()=>DealerServiceHistoryController());
    Get.lazyPut(()=>VehicleWarrantyController());

  }
}