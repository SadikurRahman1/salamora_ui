import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/onboarding/views/onboarding_screen.dart';
import 'package:selemara/features/splash/bindings/splash_binding.dart';
import 'package:selemara/features/splash/screen/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onBoarding,
      page: () => OnboardingScreen(),
      // binding: AuthBinding(),
    ),
    // GetPage(
    //   name: AppRoutes.login,
    //   page: () => const LoginPage(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.register,
    //   page: () => const RegisterPage(),
    //   binding: AuthBinding(),
    // ),
    // GetPage(
    //   name: AppRoutes.home,
    //   page: () => const HomePage(),
    //   // You can create a HomeBinding() if needed
    // ),
    // GetPage(
    //   name: AppRoutes.profile,
    //   page: () => const ProfilePage(),
    //   binding: ProfileBinding(),
    // ),
  ];

  static final initialBinding = SplashBinding();
}
