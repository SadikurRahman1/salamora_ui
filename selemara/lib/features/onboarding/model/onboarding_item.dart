import 'package:get/get.dart';
import 'package:selemara/core/constants/app_images.dart';

class OnboardingItem {
  final String imagePath;
  final String title;
  final String description;

  OnboardingItem({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}

final List<OnboardingItem> onboardingPages = [
  OnboardingItem(
    imagePath: AppImages.onBoardingOne,
    title: 'onboard_title_1'.tr,
    description: 'onboard_desc_1'.tr,
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingTwo,
    title: 'onboard_title_2'.tr,
    description: 'onboard_desc_2'.tr,
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingThree,
    title: 'onboard_title_3'.tr,
    description: 'onboard_desc_3'.tr,
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingFour,
    title: 'onboard_title_4'.tr,
    description: 'onboard_desc_4'.tr,
  ),
];
