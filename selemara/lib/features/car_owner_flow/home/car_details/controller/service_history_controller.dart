import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceHistoryController extends GetxController {
  var rating = 5.0.obs;
  var selectedDate = Rxn<DateTime>();
  Rx<String?> selectedLevel = Rx<String?>(null); // nullable

  void changeLevel(String? val) {
    selectedLevel.value = val;
  }

  RxList<String> serviceTypeList =
      <String>[
        "Oil Change",
        "Tire Replacement",
        "Battery Check",
        "Car Wash",
      ].obs;

  RxList<String> urgencyList = <String>["LOW", "MEDIUM", "HIGH"].obs;

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
}
