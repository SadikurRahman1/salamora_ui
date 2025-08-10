import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddVehicleController extends GetxController {
  TextEditingController vinController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController expiresController = TextEditingController();
  TextEditingController tremsController = TextEditingController();
  TextEditingController currentController = TextEditingController();
  Rxn<File> file = Rxn<File>();
}
