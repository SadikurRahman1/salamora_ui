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
    title: 'Smart AutoCare',
    description:
        'Track your car’s full service history, book garage appointments, and verify any vehicle by VIN number — all in one app.',
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingTwo,
    title: 'Service & History',
    description:
        'Car owners can easily book services, track maintenance history, and access service records anytime.',
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingThree,
    title: 'Check Before You Buy',
    description:
        'Enter the VIN number to verify how many times a car was serviced and where — transparency before you.',
  ),
  OnboardingItem(
    imagePath: AppImages.onBoardingFour,
    title: 'Grow Your Garage Business',
    description:
        'Garages can log services done, dealerships can sell cars with verified history — all synced with our platform.',
  ),
];
