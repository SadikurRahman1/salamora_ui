import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import 'buyer_profile_controller.dart';

class BuyerEditProfileController extends GetxController {
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // var selectedOption = ''.obs;
  // final List<String> genders = ['Male', 'Female', 'Other'];

  BuyerProfileController controller = Get.find<BuyerProfileController>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = controller.userData.value?.name ?? "";
    emailController.text = controller.userData.value?.email ?? "";

  }

  Future<void> updateProfile() async {
    isLoading.value = true;

    try {
      final updateProfileBody = {
        "name": nameController.text,
        "email": emailController.text,
        "location": addressController.text,

      };

      ResponseData responseData = await NetworkCaller().putRequest(
        url: ApiUrls.updateProfile,
        body: updateProfileBody,
      );

      if (responseData.isSuccess) {
        controller.fetchUserProfile();
        Get.back();
        Get.snackbar("Success", "Profile update successfully!");
        clear();
      } else {
        Get.snackbar("Failed", responseData.message ?? "Invalid credentials");
      }

      isLoading.value = false;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    addressController.clear();
  }
}
