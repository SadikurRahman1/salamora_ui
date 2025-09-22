import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import 'my_profile_controller.dart';

class GarageEditProfileController extends GetxController {
  var isLoading = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  // var selectedOption = ''.obs;
  // final List<String> genders = ['Male', 'Female', 'Other'];

  MyProfileController controller = Get.find<MyProfileController>();

  @override
  void onInit() {
    super.onInit();
    nameController.text = controller.userData.value?.name ?? "";
    emailController.text = controller.userData.value?.email ?? "";

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
