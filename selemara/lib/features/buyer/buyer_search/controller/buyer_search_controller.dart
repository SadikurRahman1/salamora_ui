import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:selemara/features/buyer/home/views/buyer_car_details_screen.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/buyer_vin_search_model.dart';
import '../model/service_history_details_model.dart';

class BuyerSearchController extends GetxController {
  var isLoading = false.obs;
  var vinInput = ''.obs;
  TextEditingController searchTEController = TextEditingController();
  Rxn<VehicleModel> vehicle = Rxn<VehicleModel>();

  void setVinInput(String val) {
    vinInput.value = val.trim();
  }

  Future<void> getVinSearchResult() async {
    isLoading.value = true;

    String vin = searchTEController.text.trim();
    ResponseData responseData = await NetworkCaller().getRequest(
      ApiUrls.searchVin(vin),
    );

    if (responseData.isSuccess && responseData.data != null) {
      try {
        final Map<String, dynamic> data = responseData.data["data"];
        vehicle.value = VehicleModel.fromJson(data);

        debugPrint("✅ VIN Search Success: ${vehicle.value?.name}");
        fetchServiceHistory();
        Get.to(()=>BuyerCarDetailsScreen());
      } catch (e) {
        debugPrint("❌ Data parsing error: $e");
        Get.snackbar("Error", "Failed to parse vehicle data");
      }
    } else {
      Get.snackbar("Error", responseData.message ?? "Failed to fetch vehicle");
    }

    isLoading.value = false;
  }



  RxList<ServiceHistoryItem> serviceHistoryList = <ServiceHistoryItem>[].obs;


  Future<void> fetchServiceHistory() async {
    String? id = vehicle.value?.uniqueId;
    if (id == null) return;

    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.serviceHistory(id),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {

          final Map<String, dynamic> decoded = responseData.data is String
              ? jsonDecode(responseData.data)
              : responseData.data;

          final List<dynamic> dataList = decoded["data"]["data"];

          serviceHistoryList.value =
              dataList.map((e) => ServiceHistoryItem.fromJson(e)).toList();

          debugPrint("🔍 Raw responseData.data: ${responseData.data}");

          debugPrint("✅ Service History fetched: ${serviceHistoryList.length} items");
          debugPrint("✅ ==================================");
        } catch (e) {
          debugPrint("❌ Data parsing error: $e");
          Get.snackbar("Error", "Failed to parse service history data");
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

}
