import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/service_history_details_model.dart';
import 'buyer_search_controller.dart';

class BuyerServiceHistoryController extends GetxController {
  var isLoading = false.obs;
  RxList<ServiceHistoryItem> serviceHistoryList = <ServiceHistoryItem>[].obs;
  BuyerSearchController controller = Get.find<BuyerSearchController>();

  @override
  void onInit() {
    super.onInit();
    fetchServiceHistory();
  }

  Future<void> fetchServiceHistory() async {

    String? id = controller.vehicle.value?.id;

    if (id == null) return;
    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.serviceHistory(id),
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {
          final List<dynamic> dataList = responseData.data["data"]["data"];
          serviceHistoryList.value = dataList
              .map((item) => ServiceHistoryItem.fromJson(item))
              .toList();

          debugPrint(
              "✅ Service History fetched: ${serviceHistoryList.length} items");

          debugPrint(
              "✅ ==================================");

          // Get.to(() => BuyerServiceHistoryDetailsScreen());
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

  void clearServiceHistory() {
    serviceHistoryList.clear();
  }
}
