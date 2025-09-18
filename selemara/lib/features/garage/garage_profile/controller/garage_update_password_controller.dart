import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:selemara/core/services/network_caller.dart';
import 'package:selemara/core/services/response_data.dart';

import '../../../../core/constants/api_urls.dart';

class  GarageUpdatePasswordController extends GetxController{

  TextEditingController oldController = TextEditingController();
  TextEditingController newController = TextEditingController();
  TextEditingController confirmController = TextEditingController();

  final isLoading = false.obs;

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

