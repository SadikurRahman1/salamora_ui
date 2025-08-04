import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  void skip() {
    // Navigate to login or home
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
