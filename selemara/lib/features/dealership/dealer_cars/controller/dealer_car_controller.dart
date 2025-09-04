import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DealerCarController extends GetxController {
  TextEditingController carSearchTEController = TextEditingController();
  var selectStatus = RxString('');
  var statusList = <String>[].obs;

  @override
  void onInit() {
    super.onInit();
    statusList.assignAll(['All Status', 'Pending', 'Completed']);
  }


}
