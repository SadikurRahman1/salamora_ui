import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/services/network_caller.dart';
import 'package:selemara/core/services/response_data.dart';
import '../../../../core/constants/api_urls.dart';
import '../model/user_data_model.dart';

class BuyerUserDataController extends GetxController {
  var isLoading = false.obs;
  var userData = Rxn<UserDataModel>();

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;

    ResponseData responseData = await NetworkCaller().getRequest(
      ApiUrls.getProfile,
    );


    debugPrint(jsonEncode(responseData.data));
    debugPrint("=================================");
    debugPrint(responseData.data);

    debugPrint("User name: ${userData.value?.name}");


    if (responseData.isSuccess && responseData.data != null) {
      userData.value =
          UserDataModel.fromJson(responseData.data as Map<String, dynamic>);
      debugPrint("User name: ${userData.value?.name}");
    } else {
      Get.snackbar("Error", responseData.message ?? "Failed to fetch profile");
    }

    isLoading.value = false;
  }

  Future<void> refreshProfile() async {
    await fetchUserProfile();
  }
}
