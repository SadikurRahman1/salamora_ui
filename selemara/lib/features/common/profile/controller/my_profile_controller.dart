import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/user_data_model.dart';

class MyProfileController extends GetxController {
  var isActive = false.obs;
  var isLoading = false.obs;
  var userData = Rxn<UserDataModel>();


  void toggle() {
    isActive.value = !isActive.value;
  }

  void setValue(bool val) {
    isActive.value = val;
  }


  void toggleTheme() {
    isActive.value = !isActive.value;
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

  }





}
