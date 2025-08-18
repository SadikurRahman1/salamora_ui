import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/api_urls.dart';
import '../../../../../core/services/network_caller.dart';
import '../../../../../core/services/response_data.dart';
import '../model/request_service.dart';

class RequestServiceController extends GetxController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  RxList<String> serviceTypeList =
      <String>[
        "Oil Change",
        "Tire Replacement",
        "Battery Check",
        "Car Wash",
      ].obs;

  RxList<String> urgencyList =
      <String>[
        "LOW",
        "MEDIUM", // Fixed spacing - removed extra space
        "HIGH",
      ].obs;

  Rx<String?> selectedLevel = Rx<String?>(null); // nullable, starts as null

  void changeLevel(String? val) {
    selectedLevel.value = val;
  }

  RxnString selectedService = RxnString(); // initially null

  void changeSelectionItem(String? val) {
    selectedService.value = val;
  }

  var selected = RxnString();
  var allGarageList = Rxn<GarageListResponse>();
  var selectedGarage = Rxn<Garage>();

  List<Garage> garageList = [];
  List<String> garageNameList = [];

  void changeSelection(String? value) {
    if (value == null) {
      selectedGarage.value = null;
      return;
    }

    try {
      selectedGarage.value = garageList.firstWhere((g) => g.name == value);
      log("....................${selectedGarage.value?.name}");
    } catch (e) {
      selectedGarage.value = null;
    }
  }

  Future<void> getAllCar() async {
    var url = ApiUrls.getGarageList;

    try {
      ResponseData responseData = await NetworkCaller().getRequest(url);

      if (responseData.isSuccess) {
        var data = GarageListResponse.fromJson(responseData.data);
        allGarageList.value = data;

        if (allGarageList.value?.data?.data != null) {
          garageList.clear();
          garageNameList.clear();
          for (var garage in allGarageList.value!.data!.data!) {
            garageNameList.add(garage.name ?? "");
            garageList.add(garage);
          }
        }
      }
    } catch (e) {
      log("error : $e");
    }
  }

  var selectedDate = Rxn<DateTime>();

  void pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? now,
      firstDate: DateTime(now.year - 10),
      lastDate: DateTime(now.year + 10),
    );
    if (picked != null) {
      selectedDate.value = picked;
    }
  }

  void postRequestService() async {
    if (selectedLevel.value != null &&
        selectedGarage.value != null &&
        selectedDate.value != null &&
        selectedService.value != null &&
        descriptionController.text.isNotEmpty) {
      var url = ApiUrls.requestServicePost;
      Map<String, String> body = {
        "vehicleId": "astdfauedy",
        "garageId": selectedGarage.value?.id ?? "",
        "serviceType": selectedService.value ?? "",
        "description": descriptionController.text,
        "preferredDate": selectedDate.value?.toIso8601String() ?? "",
        "urgencyLevel": "HIGH",
      };

      ResponseData responseData = await NetworkCaller().postRequest(
        url: url,
        body: body,
      );
    } else {
      Get.snackbar("Login Failed", "Invalid credentials");
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    getAllCar();
  }
}
