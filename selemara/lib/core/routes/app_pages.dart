import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/auth/binding/auth_binding.dart';
import 'package:selemara/features/auth/views/forgot_password_screen.dart';
import 'package:selemara/features/auth/views/reset_password_screen.dart';
import 'package:selemara/features/auth/views/verify_code_screen.dart';
import 'package:selemara/features/buyer/home/views/buyer_home_screen.dart';
import 'package:selemara/features/garage/garage_nav_bar/bindings/garage_binding.dart';
import 'package:selemara/features/garage/garage_nav_bar/view/garage_nav_bar_screen.dart';
import 'package:selemara/features/onboarding/views/onboarding_screen.dart';
import 'package:selemara/features/splash/bindings/splash_binding.dart';
import 'package:selemara/features/splash/screen/splash_screen.dart';

import '../../features/auth/views/login_screen.dart';
import '../../features/auth/views/register_screen.dart';
import '../../features/buyer/buyer_nav_bar/bindings/buyer_binding.dart';
import '../../features/buyer/buyer_nav_bar/view/buyer_nau_bar_screen.dart';
import '../../features/car_owner_flow/car_owner_nevbar/view/owner_navbar_screen.dart';
import '../../features/car_owner_flow/home/binding/home_binding.dart';
import '../../features/car_owner_flow/home/car_details/view/car_details_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/request_service_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/service_history_screen.dart';
import '../../features/car_owner_flow/home/car_details/view/warranty_details_screen.dart';
import '../../features/car_owner_flow/home/my_car_add_vehicle/view/add_vehicle_screen.dart';
import '../../features/car_owner_flow/home/my_car_add_vehicle/view/my_cars_screen.dart';
import '../../features/car_owner_flow/home/view/invoice_details_screen.dart';
import '../../features/car_owner_flow/profile/binding/profile_binding.dart';
import '../../features/car_owner_flow/profile/view/edit_profile_screen.dart';
import '../../features/car_owner_flow/profile/view/help_support_screen.dart';
import '../../features/car_owner_flow/profile/view/profile_screen.dart';
import '../../features/car_owner_flow/profile/view/update_password_screen.dart';
import '../../features/car_owner_flow/reminders/view/add_reminder_screen.dart';
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
      page:
          () => ResetPasswordScreen(phoneNumber: Get.arguments["phoneNumber"]),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.forgot,
      page: () => ForgotPasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.verify,
      page: () {
        final args = Get.arguments as Map<String, dynamic>? ?? {};
        return VerifyCodeScreen(
          phoneNumber: args['phoneNumber'] ?? '',
          isPasswordReset: args['isPasswordReset'] ?? false,
        );
      },
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
      binding: HomeBinding(),
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
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.myCarsScreen,
      page: () => MyCarsScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.addVehicleScreen,
      page: () => AddVehicleScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.carDetailsScreen,
      page: () => CarDetailsScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.requestServiceScreen,
      page: () => RequestServiceScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.serviceHistoryScreen,
      page: () => ServiceHistoryScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.warrantyDetailsScreen,
      page: () => WarrantyDetailsScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.invoiceDetailsScreen,
      page: () => InvoiceDetailsScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.addReminderScreen,
      page: () => AddReminderScreen(),
      binding: HomeBinding(),
    ),

    GetPage(
      name: AppRoutes.helpSupportScreen,
      page: () => HelpSupportScreen(),
      binding: HomeBinding(),
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


    GetPage(
      name: AppRoutes.buyerNavScreen,
      page: () => BuyerNauBarScreen(),
      binding: BuyerBinding(),
    ),

    GetPage(
      name: AppRoutes.buyerHomeScreen,
      page: () => BuyerHomeScreen(),
      binding: HomeBinding(),
    ),

  ];

  static final initialBinding = SplashBinding();
}
