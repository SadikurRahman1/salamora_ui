import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/recent-sale_model.dart';


class DealerHomeVehicleController extends GetxController {
  /// Search controller
  TextEditingController carSearchTEController   = TextEditingController();

  /// Filter status
  var selectStatus = RxString('');
  var statusList = <String>[].obs;

  /// Loading state
  var isLoading = false.obs;

  /// Vehicle list
  RxList<SoldVehicleData> recentVehicles = <SoldVehicleData>[].obs;

  @override
  void onInit() {
    super.onInit();
    statusList.assignAll(['All Status', 'Pending', 'Completed']);

    fetchRecentSalesVehicle();
  }

  /// Fetch dealer vehicles from API


  Future<void> fetchRecentSalesVehicle() async {
    isLoading.value = true;
    try {
      ResponseData responseData = await NetworkCaller().getRequest(
        ApiUrls.dealerVehicleSold,
      );

      if (responseData.isSuccess && responseData.data != null) {
        try {


          final response = SoldVehicleResponseModel.fromJson(responseData.data);
          recentVehicles.assignAll(response.data?.data ?? []);

          print(response.data?.data?.first.buyer?.name);

          debugPrint("✅ Dealer recent vehicles loaded: ${recentVehicles.length}");
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



}
