import 'dart:async';

import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
 // Update this path

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _goToNextPage();
  }

  void _goToNextPage() {
    Timer(const Duration(seconds: 2), () {
      Get.offAllNamed(AppRoutes.onBoarding); // Replace with your next route
    });
  }
}
