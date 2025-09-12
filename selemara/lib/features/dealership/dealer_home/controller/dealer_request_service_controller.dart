import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/constants/api_urls.dart';
import '../../../../../core/services/network_caller.dart';
import '../../../../../core/services/response_data.dart';
import '../model/dealer_request_service.dart';

class DealerRequestServiceController extends GetxController {
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
        "MEDIUM",
        "HIGH",
      ].obs;

  Rx<String?> selectedLevel = Rx<String?>(null);

  void changeLevel(String? val) {
    selectedLevel.value = val;
  }

  RxnString selectedService = RxnString();

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


}
