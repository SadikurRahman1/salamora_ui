import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:selemara/core/services/network_caller.dart';
import 'package:selemara/core/services/response_data.dart';

import '../../../../core/constants/api_urls.dart';

class  BuyerUpdatePasswordController extends GetxController{

  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final isLoading = false.obs;
  Future<void> matchPassword() async{
    if(newController.text == confirmController.text){
      changePassword();
    } else{
      Get.snackbar("Failed", "New Password & Confirm Password do not match!");
    }
  }


  Future<void> changePassword() async{
    isLoading.value = true;

    final changePasswordBody = {
      "oldPassword": oldController.text,
      "newPassword": newController.text,
    };
  ResponseData responseData = await NetworkCaller().patchRequest(
      url: ApiUrls.changePassword,
      body: changePasswordBody
  );

  debugPrint("RESPONSE MASSAGE : ${responseData.message.toString()}");

    if (responseData.isSuccess && responseData.data != null) {
      Get.snackbar("Success", responseData.message ?? "");
      clear();

    } else {
      Get.snackbar("change Password Failed", responseData.message ?? "Invalid credentials");
    }
    isLoading.value = false;
  }

  @override
  void onClose() {
    oldController.dispose();
    newController.dispose();
    confirmController.dispose();
    super.onClose();
  }
  void clear(){
    oldController.clear();
    newController.clear();
    confirmController.clear();
  }

}

