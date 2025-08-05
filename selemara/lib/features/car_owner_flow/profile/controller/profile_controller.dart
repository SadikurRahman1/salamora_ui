import 'package:get/get.dart';

class ProfileController extends GetxController{

  var isDarkMode = false.obs;

  // Method to toggle the theme
  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
  }



}