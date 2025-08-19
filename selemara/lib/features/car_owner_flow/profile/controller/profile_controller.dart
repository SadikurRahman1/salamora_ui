import 'dart:ui';

import 'package:get/get.dart';

class ProfileController extends GetxController{

  var isDarkMode = false.obs;

  // Method to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  var selectedLang = "English".obs; // default

  void changeLang(String lang) {
    selectedLang.value = lang;
    if (lang == "English") {
      Get.updateLocale(const Locale('en', 'US'));
    } else {
      Get.updateLocale(const Locale('ar', 'SA'));
    }
  }

}