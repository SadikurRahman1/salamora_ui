import 'package:get/get.dart';

import '../car_details/controller/request_service_controller.dart';
import '../car_details/controller/service_history_controller.dart';
import '../my_car_add_vehicle/controller/add_vehicle_controller.dart';
import '../controller/home_controller_owner.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<HomeControllerOwner>(() => HomeControllerOwner());
    Get.lazyPut<RequestServiceController>(() => RequestServiceController());
    Get.lazyPut<ServiceHistoryController>(() => ServiceHistoryController());
    Get.lazyPut<AddVehicleController>(() => AddVehicleController());



  }
}