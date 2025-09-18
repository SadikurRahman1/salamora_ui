import 'package:get/get.dart';
import 'package:selemara/features/garage/garage_nav_bar/controller/garage_nav_bar_controller.dart';

import '../../garage_profile/controller/garage_profile_controller.dart';
import '../../garage_services/parts_invoice_and_warranty/controller/create_parts_warranty_controller.dart';
import '../../garage_services/parts_invoice_and_warranty/controller/create_service_invoice_controller.dart';

class GarageBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut(()=>GarageNavBarController());
   Get.lazyPut(()=>CreateServiceInvoiceController());
   Get.lazyPut(()=>CreatePartsWarrantyController());
   Get.lazyPut(()=>GarageProfileController());
  }
}