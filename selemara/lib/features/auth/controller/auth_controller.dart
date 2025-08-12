import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/api_urls.dart';
import 'package:selemara/core/constants/token_key.dart';
import 'package:selemara/core/helper/shared_preferences_helper.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/services/network_caller.dart';

class AuthController extends GetxController {
  final NetworkCaller networkCaller;
  final SharedPreferencesHelper _prefsHelper;

  AuthController({
    required this.networkCaller,
    SharedPreferencesHelper? prefsHelper,
  }) : _prefsHelper = prefsHelper ?? SharedPreferencesHelper();

  final phoneNumberTEController = TextEditingController();
  final passwordTEController = TextEditingController();

  final fullNameTEController = TextEditingController();
  final emailTEController = TextEditingController();
  final confirmPTEController = TextEditingController();
  final otpTEController = TextEditingController();

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final agree = false.obs;
  final selectedUserType = RxnString();

  var resendCountdown = 45.obs;
  var canResend = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
  }

  void toggleRememberMe() => rememberMe.toggle();
  void toggleAgree() => agree.toggle();

  void startResendTimer() {
    resendCountdown.value = 30;
    canResend.value = false;

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (resendCountdown.value > 0) {
        resendCountdown.value--;
      } else {
        canResend.value = true;
        timer.cancel();
      }
    });
  }

  // Future<void> resendOtp(String phoneNumber) async {
  //   // Call your API here to resend OTP
  //   final response = await networkCaller.postRequest(
  //     url: ApiUrls.resendOtpUrl, // <-- your endpoint
  //     body: {"phoneNumber": phoneNumber},
  //   );

  //   if (response.isSuccess) {
  //     Get.snackbar("OTP Sent", "A new code has been sent to your phone.");
  //     startResendTimer();
  //   } else {
  //     Get.snackbar("Error", response.message ?? "Failed to resend OTP.");
  //   }
  // }

  Future<void> login() async {
    isLoading.value = true;
    try {
      final loginBody = {
        "phoneNumber": phoneNumberTEController.text.trim(),
        "password": passwordTEController.text.trim(),
      };

      final response = await networkCaller.postRequest(
        url: ApiUrls.loginUrl,
        body: loginBody,
      );

      if (response.isSuccess && response.data != null) {
        final data = response.data['data'];

        await _saveLoginData(data);

        if (rememberMe.value) {
          await _prefsHelper.setString(
            TokenKey.savedPhoneNumber,
            phoneNumberTEController.text.trim(),
          );
          await _prefsHelper.setString(
            TokenKey.savedPassword,
            passwordTEController.text.trim(),
          );
        } else {
          await _prefsHelper.remove(TokenKey.savedPhoneNumber);
          await _prefsHelper.remove(TokenKey.savedPassword);
        }

        _navigateByRole(data['role']);
      } else {
        Get.snackbar("Login Failed", response.message ?? "Invalid credentials");
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _saveLoginData(Map<String, dynamic> data) async {
    await _prefsHelper.setString(TokenKey.accessToken, data['accessToken']);
    await _prefsHelper.setString(TokenKey.userId, data['id']);
    // await _prefsHelper.setString(TokenKey.name, data['name']);
    // await _prefsHelper.setString(TokenKey.email, data['email'] ?? '');
    // await _prefsHelper.setString(TokenKey.phoneNumber, data['phoneNumber']);
    await _prefsHelper.setString(TokenKey.role, data['role']);
  }

  Future<void> signUp() async {
    isLoading.value = true;

    if (!agree.value) {
      Get.snackbar(
        "Agreement Required",
        "You must agree to the Terms of Service and Privacy Policy before signing up.",
        snackPosition: SnackPosition.BOTTOM,
      );
      isLoading.value = false;
      return;
    }

    try {
      // debugPrint(selectedUserType.value);
      final signUpBody = {
        "name": fullNameTEController.text,
        "email": emailTEController.text,
        "password": passwordTEController.text,
        "role": selectedUserType.value,
        "phoneNumber": phoneNumberTEController.text,
      };

      debugPrint(signUpBody.values.toString());

      final response = await networkCaller.postRequest(
        url: ApiUrls.registerUrl,
        body: signUpBody,
      );

      debugPrint(response.data.toString());

      if (response.isSuccess) {
        Get.snackbar("Success", "Account created successfully");
        Get.offNamed(
          AppRoutes.verify,
          arguments: {'phoneNumber': phoneNumberTEController.text},
        );
      } else {
        Get.snackbar(
          "Sign Up Failed",
          response.message ?? "Unable to create account",
        );
      }
    } catch (_) {
      Get.snackbar("Error", "Something went wrong. Try again.");
    } finally {
      isLoading.value = false;
    }
  }

  void _navigateByRole(String role) {
    switch (role) {
      case 'CAR_OWNER':
        Get.offAllNamed(AppRoutes.ownerNavbarScreen);
        break;
      case 'GARAGE':
        Get.offAllNamed(AppRoutes.garageNavScreen);
        break;
      // case 'DEALERSHIP':
      //   Get.offAllNamed('/dealershipHome');
      //   break;
      case 'BUYER':
        Get.offAllNamed('/userHome');
        break;
      // default:
      //   Get.offAllNamed('/home');
    }
  }

  Future<void> verifyPhone({
    required String otp,
    bool isPasswordReset = false,
  }) async {
    isLoading.value = true;
    try {
      final body = {
        "otp": otp,
        "phoneNumber": phoneNumberTEController.text.trim(),
      };

      final response = await networkCaller.postRequest(
        url: ApiUrls.verifyPhoneUrl,
        body: body,
      );

      if (response.isSuccess) {
        Get.snackbar("Success", "Phone verification successful");

        if (isPasswordReset) {
          Get.offAllNamed(
            AppRoutes.resetPassword,
            arguments: {'phoneNumber': phoneNumberTEController.text.trim()},
          );
        } else {
          Get.offNamed(AppRoutes.login);
        }
      } else {
        Get.snackbar(
          "Verification Failed",
          response.message ?? "Invalid OTP. Please try again.",
        );
      }
    } catch (_) {
      Get.snackbar("Error", "Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    isLoading.value = true;
    try {
      final body = {
        "phoneNumber": email.trim(),
        "newPassword": newPassword.trim(),
      };

      final response = await networkCaller.postRequest(
        url: ApiUrls.resetPasswordUrl,
        body: body,
      );

      if (response.isSuccess) {
        Get.snackbar("Success", "Password reset successfully");
        confirmPTEController.clear();
        passwordTEController.clear();
        Get.offAllNamed(AppRoutes.login);
      } else {
        Get.snackbar(
          "Reset Failed",
          response.message ?? "Unable to reset password",
        );
      }
    } catch (_) {
      Get.snackbar("Error", "Something went wrong. Please try again.");
    } finally {
      isLoading.value = false;
    }
  }

  void loadSavedCredentials() {
    final savedPhone = _prefsHelper.getString(TokenKey.savedPhoneNumber);
    final savedPass = _prefsHelper.getString(TokenKey.savedPassword);

    if (savedPhone != null && savedPass != null) {
      phoneNumberTEController.text = savedPhone;
      passwordTEController.text = savedPass;
      rememberMe.value = true;
    }
  }

  @override
  void onClose() {
    phoneNumberTEController.dispose();
    passwordTEController.dispose();
    fullNameTEController.dispose();
    emailTEController.dispose();
    confirmPTEController.dispose();
    super.onClose();
  }
}
