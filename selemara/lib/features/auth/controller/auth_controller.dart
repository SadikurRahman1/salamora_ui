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

  final isLoading = false.obs;
  final rememberMe = false.obs;
  final agree = false.obs;
  final selectedUserType = RxnString();

  @override
  void onInit() {
    super.onInit();
    loadSavedCredentials();
  }

  void toggleRememberMe() => rememberMe.toggle();
  void toggleAgree() => agree.toggle();

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
    await _prefsHelper.setString(TokenKey.name, data['name']);
    await _prefsHelper.setString(TokenKey.email, data['email'] ?? '');
    await _prefsHelper.setString(TokenKey.phoneNumber, data['phoneNumber']);
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

      if (response.isSuccess) {
        Get.snackbar("Success", "Account created successfully");
        Get.offNamed(AppRoutes.login);
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
      // case 'USER':
      //   Get.offAllNamed('/userHome');
      //   break;
      // default:
      //   Get.offAllNamed('/home');
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
