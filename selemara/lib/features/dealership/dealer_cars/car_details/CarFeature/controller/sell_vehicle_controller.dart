import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SellVehicleController extends GetxController {
  final isLoading = false.obs;
  TextEditingController search = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController expDate = TextEditingController();
  var vinInput = ''.obs;
  // var selectName = RxString('');
  // var nameList = <String>[].obs;

  void setVinInput(String val) {
    vinInput.value = val.trim();
    debugPrint(val);

  }

  void click(){
  debugPrint(expDate.text);
  debugPrint(convertToIso8601(expDate.text));
}

  String convertToIso8601(String inputDate) {
    try {
      DateFormat inputFormat = DateFormat("d/M/yyyy");
      DateTime parsedDate = inputFormat.parse(inputDate);
      return parsedDate.toUtc().toIso8601String();
    } catch (e) {
      return "Invalid date format";
    }
  }

  @override
  void onInit() {
    super.onInit();
    // nameList.assignAll(["1", "2", "3","4", "5", "6"]);
  }



}
