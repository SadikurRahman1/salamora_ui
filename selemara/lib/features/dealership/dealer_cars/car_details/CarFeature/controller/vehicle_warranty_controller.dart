import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VehicleWarrantyController extends GetxController {



  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController vinNumberController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController coastController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  Rxn<File> file = Rxn<File>();

  var selectedDuration = RxString('');
  var durationList = <String>[].obs;

  var engine = true.obs;
  var transmission = true.obs;
  var electrical = true.obs;
  var airConditioning = false.obs;
  var steering = false.obs;
  var brakes = true.obs;
  var suspension = true.obs;

  @override
  void onInit() {
    super.onInit();
    durationList.assignAll(["6 Months", "12 Months", "24 Months"]);
  }
}
