import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  void nextPage() {
    if (currentPage.value < 3) {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    } else {
      // Navigate to login or home
    }
  }

  void skip() {
    // Navigate to login or home
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }
}
