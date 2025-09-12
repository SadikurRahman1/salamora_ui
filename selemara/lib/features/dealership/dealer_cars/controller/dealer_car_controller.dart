import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../car_details/views/dealer_car_details_screen.dart';
import '../model/dealer_single_vehicle_model.dart';
import '../model/get_vehicle_model.dart';

class DealerCarController extends GetxController {
  /// Search controller
  TextEditingController carSearchTEController   = TextEditingController();

  /// Filter status
  var selectStatus = RxString('');
  var statusList = <String>[].obs;

  /// Loading state
  var isLoading = false.obs;

  /// Vehicle list
  RxList<Vehicle> dealerVehicles = <Vehicle>[].obs;
  RxList<SingleVehicle> singleVehicles = <SingleVehicle>[].obs;

  @override
  void onInit() {
    super.onInit();
    statusList.assignAll(['All Status', 'Pending', 'Completed']);
  }

  /// Fetch dealer vehicles from API

}
