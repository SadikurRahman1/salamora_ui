import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/auth/binding/auth_binding.dart';
import 'package:selemara/features/auth/views/forgot_password_screen.dart';
import 'package:selemara/features/auth/views/reset_password_screen.dart';
import 'package:selemara/features/auth/views/verify_code_screen.dart';
import 'package:selemara/features/garage/garage_nav_bar/bindings/garage_binding.dart';
import 'package:selemara/features/garage/garage_nav_bar/view/garage_nav_bar_screen.dart';
import 'package:selemara/features/onboarding/views/onboarding_screen.dart';
import 'package:selemara/features/splash/bindings/splash_binding.dart';
import 'package:selemara/features/splash/screen/splash_screen.dart';

import '../../features/auth/views/login_screen.dart';
import '../../features/auth/views/register_screen.dart';
import '../../features/car_owner_flow/car_owner_nevbar/view/owner_navbar_screen.dart';
import '../../features/car_owner_flow/home/view/add_vehicle_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/car_details_screen.dart';
import '../../features/car_owner_flow/home/view/my_cars_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/request_service_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/service_history_screen.dart';
import '../../features/car_owner_flow/home/view/warranty_details_screen.dart';
import '../../features/car_owner_flow/profile/binding/profile_binding.dart';
import '../../features/car_owner_flow/profile/view/edit_profile_screen.dart';
import '../../features/car_owner_flow/profile/view/profile_screen.dart';
import '../../features/car_owner_flow/profile/view/update_password_screen.dart';
import '../../features/privacy_policy/privacy_policy_screen.dart';

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
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginScreen(),
      binding: AuthBinding(),
    ),

    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.resetPassword,
      page: () => ResetPasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.forgot,
      page: () => ForgotPasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.verify,
      page: () => VerifyCodeScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.updatePasswordScreen,
      page: () => UpdatePasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.ownerNavbarScreen,
      page: () => OwnerNavbarScreen(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.garageNavScreen,
      page: () => GarageNavBarScreen(),
      binding: GarageBinding(),
    ),

    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),

    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
    ),

    GetPage(
      name: AppRoutes.myCarsScreen,
      page: () => MyCarsScreen(),
    ),


    GetPage(
      name: AppRoutes.addVehicleScreen,
      page: () => AddVehicleScreen(),
    ),

    GetPage(
      name: AppRoutes.carDetailsScreen,
      page: () => CarDetailsScreen(),
    ),
    GetPage(
      name: AppRoutes.requestServiceScreen,
      page: () => RequestServiceScreen(),
    ),

    GetPage(
      name: AppRoutes.serviceHistoryScreen,
      page: () => ServiceHistoryScreen(),
    ),



    GetPage(
      name: AppRoutes.warrantyDetailsScreen,
      page: () => WarrantyDetailsScreen(),
    ),

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
