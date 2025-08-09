import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RemindersController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController statusController = TextEditingController();


  var selected = RxnString();


  void changeSelection(String? value) {
    selected.value = value;
  }



  final List<String> serviceStatuses = ["Overdue", "Soon", "Upcoming"];

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
