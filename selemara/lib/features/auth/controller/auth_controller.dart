import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:selemara/core/services/network_caller.dart';

class AuthController extends GetxController {
  final NetworkCaller _networkCaller = NetworkCaller();

  final TextEditingController phoneNumberTEController = TextEditingController();
  final TextEditingController passwordTEController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  RxBool rememberMe = false.obs;

 
  void toggleRememberMe() {
    rememberMe.value = !rememberMe.value;
  }

  /// Login Method
  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    try {
      final Map<String, dynamic> loginBody = {
        "phoneNumber": phoneNumberTEController.text.trim(),
        "password": passwordTEController.text.trim(),
      };

      final response = await _networkCaller.postRequest(
        url: "/auth/login",
        body: loginBody,
      );

      if (response.isSuccess) {
        Get.offAllNamed('/home');
      } else {}
    } catch (e) {
      Get.snackbar("Error", "An error occurred during login.");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp({
    required String phoneNumber,
    required String password,
    required String name,
  }) async {
    isLoading.value = true;
    try {
      final Map<String, dynamic> signUpBody = {
        "name": name,
        "phoneNumber": phoneNumber.trim(),
        "password": password.trim(),
      };

      final response = await _networkCaller.postRequest(
        url: "/auth/signup",
        body: signUpBody,
      );

      if (response.isSuccess) {
        Get.snackbar("Success", "Account created successfully");
        Get.offNamed('/login');
      } else {}
    } catch (e) {
      Get.snackbar("Error", "Something went wrong. Try again.");
    } finally {
      isLoading.value = false;
    }
  }

  /// Dispose controllers
  @override
  void onClose() {
    phoneNumberTEController.dispose();
    passwordTEController.dispose();
    super.onClose();
  }
}
