import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CreateVehicleInvoiceWarrantyController extends GetxController {



  TextEditingController vehicleNameController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController vinNumberController = TextEditingController();
  TextEditingController mileageController = TextEditingController();
  TextEditingController saleController = TextEditingController();
  TextEditingController customerNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  Rxn<File> file = Rxn<File>();

  var selectPayment = RxString('');
  var paymentList = <String>[].obs;


  @override
  void onInit() {
    super.onInit();
    paymentList.assignAll(["Cash", "Bakes", "Google Pay"]);
  }
}
