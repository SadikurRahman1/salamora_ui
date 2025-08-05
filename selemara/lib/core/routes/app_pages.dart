import 'package:get/get.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/features/auth/binding/auth_binding.dart';
import 'package:selemara/features/auth/views/forgot_password_screen.dart';
import 'package:selemara/features/auth/views/login_screen.dart';
import 'package:selemara/features/auth/views/register_screen.dart';
import 'package:selemara/features/auth/views/reset_password_screen.dart';
import 'package:selemara/features/auth/views/verify_code_screen.dart';
import 'package:selemara/features/onboarding/views/onboarding_screen.dart';
import 'package:selemara/features/profile/binding/profile_binding.dart';
import 'package:selemara/features/profile/view/profile_screen.dart';
import 'package:selemara/features/splash/bindings/splash_binding.dart';
import 'package:selemara/features/splash/screen/splash_screen.dart';

import '../../features/profile/view/edit_profile_screen.dart';
import '../../features/profile/view/privacy_policy_screen.dart';
import '../../features/profile/view/update_password_screen.dart';

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

    GetPage(name: AppRoutes.forgot, page: () => const ForgotPasswordScreen()),

    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
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

    GetPage(name: AppRoutes.register, page: () => const RegisterScreen()),

    GetPage(
      name: AppRoutes.privacyPolicyScreen,
      page: () => PrivacyPolicyScreen(),
    ),

    GetPage(name: AppRoutes.verify, page: () => const VerifyCodeScreen()),
    GetPage(
      name: AppRoutes.resetPassword,
      page: () => const ResetPasswordScreen(),
    ),
  ];

  static final initialBinding = SplashBinding();
}
