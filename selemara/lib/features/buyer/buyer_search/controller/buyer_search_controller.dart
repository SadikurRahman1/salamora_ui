import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BuyerSearchController extends GetxController{
  TextEditingController searchTEController = TextEditingController();
  var vinInput = ''.obs;

  void setVinInput(String val) {

    vinInput.value = val.trim();
    debugPrint(vinInput.value.toString());
  }
}