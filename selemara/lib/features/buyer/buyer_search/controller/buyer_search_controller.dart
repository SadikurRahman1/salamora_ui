import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/buyer_vin_search_model.dart';


class BuyerSearchController extends GetxController {
  var isLoading = false.obs;
  var vinInput = ''.obs;
  RxBool isPaid = false.obs;
  TextEditingController searchTEController = TextEditingController();
  Rxn<VehicleData> vehicle = Rxn<VehicleData>(); // VehicleModel -> VehicleData

  void setVinInput(String val) {
    vinInput.value = val.trim();
  }



}


