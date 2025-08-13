import 'dart:developer';

import 'package:get/get.dart';
import 'package:selemara/core/constants/api_urls.dart';

import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';
import '../model/home_model/car_respons.dart';
import '../model/home_model/profile_response.dart';
import '../model/home_model/recent_service.dart';

class HomeControllerOwner extends GetxController {
  var profileResponse = Rxn<ProfileData>();
  var allCarList = Rxn<VehicleData>();
  var allServicesList = Rxn<ServiceData>();

  Future<void> getProfile() async {

    var url = ApiUrls.getProfile;

    try {
      ResponseData responseData = await NetworkCaller().getRequest(url);

      if (responseData.isSuccess) {
        var data = ProfileResponse.fromJson(responseData.data);
        profileResponse.value = data.data;
        // log('..............................${profileResponse.value?.email}');


      } else {}
    } catch (e) {
      log("error : $e");
    }
  }



    Future<void> getAllCar() async {

    var url = ApiUrls.getAllCar;

    try {
      ResponseData responseData = await NetworkCaller().getRequest(url);

      if (responseData.isSuccess) {

        var data = VehicleResponse.fromJson(responseData.data);
        allCarList.value = data.data;
         log('..............................${allCarList.value?.data[0].name}');


      } else {}
    } catch (e) {
      log("error : $e");
    }
  }


  Future<void> getService() async {

    var url = ApiUrls.getRecentService;

    try {
      ResponseData responseData = await NetworkCaller().getRequest(url);

      if (responseData.isSuccess) {

        var data = ServiceResponse.fromJson(responseData.data);
        allServicesList.value = data.data;


      } else {}
    } catch (e) {
      log("error : $e");
    }
  }







  @override
  void onInit() {
    super.onInit();
    getProfile();
    getAllCar();
    getService();
  }
}
////