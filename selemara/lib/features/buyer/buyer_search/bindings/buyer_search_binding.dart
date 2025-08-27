import 'package:get/get.dart';
import 'package:selemara/features/buyer/buyer_search/controller/buyer_search_controller.dart';

import '../controller/buyer_service_history_controller.dart';

class BuyerSearchBinding extends Bindings{
  @override
  void dependencies() {
   Get.lazyPut( ()=> BuyerSearchController());
   Get.lazyPut( ()=> BuyerServiceHistoryController());
  }
}