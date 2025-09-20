import 'package:get/get.dart';
import 'package:selemara/core/constants/app_images.dart';

class OnboardingItem {
  final String text;
  final String title;
  final String description;

  OnboardingItem({
    required this.text,
    required this.title,
    required this.description,
  });
}

final List<OnboardingItem> onboardingPages = [
  OnboardingItem(
    text: "Track Your Vehicle",
    title: 'FOR CAR OWNERS'.tr,
    description: 'onboard_desc_1'.tr,
  ),
  OnboardingItem(
    text: "Manage Your Business",
    title: ' FOR GARAGES'.tr,
    description: 'onboard_desc_2'.tr,
  ),
  OnboardingItem(
    text: "Buy With Confidence ",
    title: 'FOR GARAGES'.tr,
    description: 'onboard_desc_3'.tr,
  ),
  OnboardingItem(
    text: "Sell Premium Cars",
    title: ' FOR DEALERSHIPS'.tr,
    description: 'onboard_desc_4'.tr,
  ),
];
