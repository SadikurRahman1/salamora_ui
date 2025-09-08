// import 'dart:convert';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';
// import 'package:selemara/features/buyer/home/views/buyer_car_details_screen.dart';
// import '../../../../core/constants/api_urls.dart';
// import '../../../../core/services/network_caller.dart';
// import '../../../../core/services/response_data.dart';
// import '../model/buyer_vin_search_model.dart';
// import '../model/service_history_details_model.dart';
//
// class BuyerSearchController extends GetxController {
//   var isLoading = false.obs;
//   var vinInput = ''.obs;
//   TextEditingController searchTEController = TextEditingController();
//   Rxn<VehicleModel> vehicle = Rxn<VehicleModel>();
//
//   void setVinInput(String val) {
//     vinInput.value = val.trim();
//   }
//
//   Future<void> getVinSearchResult() async {
//     isLoading.value = true;
//
//     String vin = searchTEController.text.trim();
//     ResponseData responseData = await NetworkCaller().getRequest(
//       ApiUrls.searchVin(vin),
//     );
//
//     if (responseData.isSuccess && responseData.data != null) {
//       try {
//         final Map<String, dynamic> data = responseData.data["data"];
//         vehicle.value = VehicleModel.fromJson(data);
//
//         debugPrint("✅ VIN Search Success: ${vehicle.value?.name}");
//         fetchServiceHistory();
//         Get.to(()=>BuyerCarDetailsScreen());
//       } catch (e) {
//         debugPrint("❌ Data parsing error: $e");
//         Get.snackbar("Error", "Failed to parse vehicle data");
//       }
//     } else {
//       Get.snackbar("Error", responseData.message ?? "Failed to fetch vehicle");
//     }
//
//     isLoading.value = false;
//   }
//
//
//
//   RxList<ServiceHistoryItem> serviceHistoryList = <ServiceHistoryItem>[].obs;
//
//
//   Future<void> fetchServiceHistory() async {
//     String? id = vehicle.value?.uniqueId;
//     if (id == null) return;
//
//     isLoading.value = true;
//     try {
//       ResponseData responseData = await NetworkCaller().getRequest(
//         ApiUrls.serviceHistory(id),
//       );
//
//       if (responseData.isSuccess && responseData.data != null) {
//         try {
//
//           final Map<String, dynamic> decoded = responseData.data is String
//               ? jsonDecode(responseData.data)
//               : responseData.data;
//
//           final List<dynamic> dataList = decoded["data"]["data"];
//
//           serviceHistoryList.value =
//               dataList.map((e) => ServiceHistoryItem.fromJson(e)).toList();
//
//           debugPrint("🔍 Raw responseData.data: ${responseData.data}");
//
//           debugPrint("✅ Service History fetched: ${serviceHistoryList.length} items");
//           debugPrint("✅ ==================================");
//         } catch (e) {
//           debugPrint("❌ Data parsing error: $e");
//           Get.snackbar("Error", "Failed to parse service history data");
//         }
//       } else {
//         Get.snackbar("Error", responseData.message ?? "Failed to fetch data");
//       }
//     } catch (e) {
//       debugPrint("❌ API call error: $e");
//       Get.snackbar("Error", "Something went wrong");
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
// }
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:selemara/features/buyer/buyer_search/view/buyer_car_details_screen.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../buyer_records/views/buyer_ownership_details.dart';
import '../buyer_records/views/buyer_ownership_history.dart';
import '../model/buyer_vin_search_model.dart';
import '../model/owner_details_model.dart';
import '../model/owner_history.dart';
import '../model/service_history_details_model.dart';

class BuyerSearchController extends GetxController {
  var isLoading = false.obs;
  var vinInput = ''.obs;
  RxBool isPaid = false.obs;
  TextEditingController searchTEController = TextEditingController();
  Rxn<VehicleData> vehicle = Rxn<VehicleData>(); // VehicleModel -> VehicleData

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
        vehicle.value = VehicleData.fromJson(data); // VehicleModel -> VehicleData

        debugPrint("✅ VIN Search Success: ${vehicle.value?.id}");
        Get.to(() => BuyerCarDetailsScreen());
        // fetchServiceHistory();
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

    String vin = searchTEController.text.trim();

    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.serviceHistory(vin),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          isPaid.value = true;
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


  RxList<OwnerHistoryData> ownerHistoryList = <OwnerHistoryData>[].obs;

  Future<void> ownerHistory() async {
    String vin = searchTEController.text.trim();

    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.ownerHistory(vin),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          isPaid.value = true;

          final Map<String, dynamic> decoded = responseData.data is String
              ? jsonDecode(responseData.data)
              : responseData.data;

          final List<dynamic> dataList = decoded["data"] ?? [];

          if (dataList.isNotEmpty) {
            ownerHistoryList.value =
                dataList.map((e) => OwnerHistoryData.fromJson(e)).toList();

            Get.to(() => BuyerOwnershipHistory());
            debugPrint("✅ Owner History fetched: ${ownerHistoryList.length} items");
          } else {
            debugPrint("⚠ কোনো Owner History পাওয়া যায়নি");
            Get.snackbar("Info", "No owner history found for this VIN");
          }
        } catch (e) {
          debugPrint("❌ Data parsing error: $e");
          Get.snackbar("Error", "Failed to parse owner history data");
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


  /// Owner details



  RxList<OwnerDetails> ownerDetailsList = <OwnerDetails>[].obs;

  Future<void> ownerDetails(String id) async {
    String vin = searchTEController.text.trim();

    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.vehicleHistoryByOwner(vin, id),
      );

      if (responseData.isSuccess) {
        final data = responseData.data['data'];

        if (data == null) {
          ownerDetailsList.clear();
          debugPrint("⚠️ API returned null data");
        } else if (data is Map<String, dynamic>) {
          ownerDetailsList.value = [OwnerDetails.fromJson(data)];
        }

        // if (!Get.isOverlaysClosed && Get.isRegistered<BuyerSearchController>()) {
        //   Get.to(() => BuyerOwnershipDetails());
        // }

        Get.to(() => BuyerOwnershipDetails());
        debugPrint(ownerDetailsList.first.toJson().toString());

        debugPrint("✅ Owner Details fetched: ${ownerDetailsList.length} items");
      } else {
        debugPrint("❌ API failed: ${responseData.message}");
        Get.snackbar("Error", responseData.message ?? "Failed to fetch details");
      }

    } catch (e) {
      debugPrint("❌ API call error: $e");
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }


}


