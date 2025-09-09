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
    fetchDealerVehicle();
  }

  /// Fetch dealer vehicles from API
  Future<void> fetchDealerVehicle() async {
    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.dealerVehicle,
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          final vehicleResponse = VehicleResponseModel.fromJson(responseData.data);
          dealerVehicles.assignAll(vehicleResponse.data?.data ?? []);


          debugPrint("✅ Dealer vehicles loaded: ${dealerVehicles.length}");
        } catch (e) {
          debugPrint("❌ Data parsing error: $e");
          Get.snackbar("Error", "Failed to parse vehicle data");
        }
      } else {
        Get.snackbar("Error", responseData.message ?? "Failed to fetch data");
      }
    } catch (e) {
      debugPrint("❌ API call error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> fetchSingleVehicle(String id) async {
    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.singleVehicle(id),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          final Map<String, dynamic> data = responseData.data["data"];


          final vehicle = SingleVehicle.fromJson(data);


          singleVehicles.clear();
          singleVehicles.add(vehicle);

          Get.to(() => DealerCarDetailsScreen());
          debugPrint("✅ Dealer vehicles loaded: ${singleVehicles.length}");
        } catch (e) {
          debugPrint("❌ Data parsing error: $e");
          Get.snackbar("Error", "Failed to parse vehicle data");
        }
      } else {
        Get.snackbar("Error", responseData.message ?? "Failed to fetch data");
      }
    } catch (e) {
      debugPrint("❌ API call error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }


  Future<void> searchVehicle(String search) async {
    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.vehicleSearch(search),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          final vehicleResponse = VehicleResponseModel.fromJson(responseData.data);
          dealerVehicles.assignAll(vehicleResponse.data?.data ?? []);


          debugPrint("✅- Dealer vehicles loaded: ${dealerVehicles.length}");
        } catch (e) {
          debugPrint("❌ Data parsing error: $e");
          Get.snackbar("Error", "Failed to parse vehicle data");
        }
      } else {
        Get.snackbar("Error", responseData.message ?? "Failed to fetch data");
      }
    } catch (e) {
      debugPrint("❌ API call error: $e");
    } finally {
      isLoading.value = false;
    }
  }


}
