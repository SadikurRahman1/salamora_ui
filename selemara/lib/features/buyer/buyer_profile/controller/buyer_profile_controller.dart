import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/user_data_model.dart';

class BuyerProfileController extends GetxController {
  var isDarkMode = false.obs;
  var isLoading = false.obs;
  var userData = Rxn<UserDataModel>();


  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  var selectedLang = "English".obs;

  void changeLang(String lang) {
    selectedLang.value = lang;
    if (lang == "English") {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ar', 'SA'));
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserProfile();
  }

  Future<void> refreshProfile() async {
    await fetchUserProfile();
  }

  Future<void> fetchUserProfile() async {
    isLoading.value = true;

    ResponseData responseData = await NetworkCaller().getRequest(
      ApiUrls.getProfile,
    );

    if (responseData.isSuccess && responseData.data != null) {
      final Map<String, dynamic> data = responseData.data["data"];
      userData.value = UserDataModel.fromJson(data);
    } else {
      Get.snackbar("Error", responseData.message ?? "Failed to fetch profile");
    }

    isLoading.value = false;
  }









}
