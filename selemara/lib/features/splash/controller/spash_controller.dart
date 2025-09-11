import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/token_key.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';
import 'package:selemara/core/routes/app_routes.dart';

class SplashController extends GetxController {
  final SharedPreferencesHelper _prefsHelper = SharedPreferencesHelper();

  @override
  void onInit() {
    super.onInit();
    _goToNextPage();
  }

  Future<void> _goToNextPage() async {
    Timer(const Duration(seconds: 2), () async {
      final role = _prefsHelper.getString(TokenKey.role);
      debugPrint("roledaskdjksdj: $role");

      if (role != null && role.isNotEmpty) {
        switch (role) {
          // case 'SUPERADMIN':
          //   Get.offAllNamed(AppRoutes.superAdminHome);
          //   break;
          case 'CAR_OWNER':
            Get.offAllNamed(AppRoutes.ownerNavbarScreen);
            break;
          case 'DEALERSHIP':
            Get.offAllNamed(AppRoutes.dealerNauBarScreen);
            break;
          case 'GARAGE':
            Get.offAllNamed(AppRoutes.garageNavScreen);
            break;
          case 'BUYER':
            Get.offAllNamed(AppRoutes.buyerNavScreen);
            break;
          default:
            Get.offAllNamed(AppRoutes.onBoarding);
        }
      } else {
        Get.offAllNamed(AppRoutes.onBoarding);
      }
    });
  }
}
