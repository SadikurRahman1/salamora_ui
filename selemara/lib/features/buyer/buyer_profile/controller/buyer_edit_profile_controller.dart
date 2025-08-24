import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import 'buyer_profile_controller.dart';

class BuyerEditProfileController extends GetxController {
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  // var selectedOption = ''.obs;
  // final List<String> genders = ['Male', 'Female', 'Other'];

  BuyerProfileController controller = Get.find<BuyerProfileController>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = controller.userData.value?.name ?? "";
    bioController.text = controller.userData.value?.bio ?? "";
  }

  Future<void> updateProfile() async {
    isLoading.value = true;

    try {
      final updateProfileBody = {
        "name": nameController.text,
        // "location": addressController.text,
        "bio": bioController.text,
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
    phoneController.dispose();
    addressController.dispose();
    bioController.dispose();
    super.dispose();
  }

  void clear() {
    nameController.clear();
    phoneController.clear();
    addressController.clear();
    bioController.clear();
  }
}
