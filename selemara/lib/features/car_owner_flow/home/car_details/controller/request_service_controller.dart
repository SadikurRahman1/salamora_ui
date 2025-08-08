import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestServiceController extends GetxController{
  var selected = RxnString();

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();



  void changeSelection(String? value) {
    selected.value = value;
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

}