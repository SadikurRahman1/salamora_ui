import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/auth/binding/auth_binding.dart';
import 'package:selemara/features/auth/views/forgot_password_screen.dart';
import 'package:selemara/features/auth/views/reset_password_screen.dart';
import 'package:selemara/features/auth/views/verify_code_screen.dart';
import 'package:selemara/features/onboarding/views/onboarding_screen.dart';
import 'package:selemara/features/splash/bindings/splash_binding.dart';
import 'package:selemara/features/splash/screen/splash_screen.dart';

import '../../features/auth/views/login_screen.dart';
import '../../features/auth/views/register_screen.dart';
import '../../features/car_owner_flow/car_owner_nevbar/view/owner_navbar_screen.dart';
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
      page: () =>  ProfileScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.resetPassword,
      page: () =>  ResetPasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.forgot,
      page: () =>  ForgotPasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.verify,
      page: () =>  VerifyCodeScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.editProfileScreen,
      page: () =>  EditProfileScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.updatePasswordScreen,
      page: () =>  UpdatePasswordScreen(),
      binding: ProfileBinding(),
    ),

    GetPage(
      name: AppRoutes.ownerNavbarScreen,
      page: () =>  OwnerNavbarScreen(),
      binding: ProfileBinding(),
    ),



    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),

        GetPage(name: AppRoutes.privacyPolicyScreen, page: () =>  PrivacyPolicyScreen()),




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
