import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BuyerEditProfileController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateBirthController = TextEditingController();

  var selectedOption = ''.obs;
  final List<String> genders = ['Male', 'Female', 'Other'];

}