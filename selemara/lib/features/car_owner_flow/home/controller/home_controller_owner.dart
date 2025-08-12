import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:selemara/core/constants/api_urls.dart';

import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/home_model/profile_response.dart';

class HomeControllerOwner extends GetxController {
  var profileResponse = Rxn<ProfileData>();

  Future<void> getProfile() async {

    var url = ApiUrls.getProfile;

    try {
      ResponseData responseData = await NetworkCaller().getRequest(url);

      if (responseData.isSuccess) {
        var data = ProfileResponse.fromJson(responseData.data);
        profileResponse.value = data.data;
        log('..............................${profileResponse.value?.email}');


      } else {}
    } catch (e) {
      log("error : $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getProfile();
  }
}
////