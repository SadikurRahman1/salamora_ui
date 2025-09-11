import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/constants/token_key.dart';
import '../../../../core/constants/api_urls.dart';
import '../../dealer_cars/controller/dealer_car_controller.dart';
import '../model/urls_model.dart';



class DealerAddVehicleController extends GetxController {
  // Text controllers
  var isLoading = false.obs;

  TextEditingController vinController = TextEditingController();
  TextEditingController carNameController = TextEditingController();
  TextEditingController makeController = TextEditingController();
  TextEditingController modelController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController currentController = TextEditingController();

  // Multiple files
  RxList<File> vehicleFiles = <File>[].obs;
  RxList<File> documentFiles = <File>[].obs;

  RxList<FileUrl> uploadedVehicleFiles = <FileUrl>[].obs;
  RxList<FileUrl> uploadedDocumentFiles = <FileUrl>[].obs;

  DealerCarController controller = Get.find();

  /// Add vehicle image
  void addVehicleFile(File file) {
    vehicleFiles.add(file);
    uploadVehicleFile(file);
  }

  /// Add document
  void addDocumentFile(File file) {
    documentFiles.add(file);
    uploadDocumentFile(file);
  }

  /// Upload single vehicle image
  Future<void> uploadVehicleFile(File file) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TokenKey.accessToken);
    if (token == null) return;

    var uri = Uri.parse(ApiUrls.uploadImage);
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = token; // Bearer not needed
    request.files.add(await http.MultipartFile.fromPath('files', file.path));

    try {
      var response = await request.send();
      var respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Vehicle uploaded: $respStr");
        uploadedVehicleFiles.addAll(FileUrl.parseUploadResponse(respStr));
      } else {
        print("❌ Vehicle upload failed: $respStr");
      }
    } catch (e) {
      print("Error uploading vehicle image: $e");
    }
  }

  /// Upload single document
  Future<void> uploadDocumentFile(File file) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TokenKey.accessToken);
    if (token == null) return;

    var uri = Uri.parse(ApiUrls.uploadImage);
    var request = http.MultipartRequest('POST', uri);
    request.headers['Authorization'] = token; // Bearer not needed
    request.files.add(await http.MultipartFile.fromPath('files', file.path));

    try {
      var response = await request.send();
      var respStr = await response.stream.bytesToString();
      if (response.statusCode == 200 || response.statusCode == 201) {
        print("✅ Document uploaded: $respStr");
        uploadedDocumentFiles.addAll(FileUrl.parseUploadResponse(respStr));
      } else {
        print("❌ Document upload failed: $respStr");
      }
    } catch (e) {
      print("Error uploading document: $e");
    }
  }


  Future<void> submitVehicle() async {
    isLoading.value = true;
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString(TokenKey.accessToken);
    if (token == null) return;

    final vehicleImages = uploadedVehicleFiles.map((e) => e.url!).toList();
    final documents = uploadedDocumentFiles
        .map((e) => {'name': e.name!, 'url': e.url!})
        .toList();

    if (vehicleImages.isEmpty) {
      print("❌ No vehicle images uploaded");
      return;
    }

    final body = {
      "vin": vinController.text,
      "name": carNameController.text,
      "brand": makeController.text,
      "model": modelController.text,
      "year": yearController.text,
      "color": colorController.text,
      "currentMileage": int.tryParse(currentController.text) ?? 0,
      "documents": documents,
      "images": vehicleImages,
    };

    try {
      var response = await http.post(
        Uri.parse(ApiUrls.addVehicles),
        headers: {
          'Authorization': token,
          'Content-Type': 'application/json',
        },
        body: jsonEncode(body),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Success হলে clear করা এবং back করা
        vehicleFiles.clear();
        documentFiles.clear();
        uploadedVehicleFiles.clear();
        uploadedDocumentFiles.clear();

        super.onClose();

        controller.fetchDealerVehicle();
        Get.back();


      }

    } catch (e) {
      print("Error submitting vehicle: $e");
    }

    isLoading.value = false;
  }


  @override
  void onClose() {
    // Dispose TextEditingControllers
    vinController.dispose();
    carNameController.dispose();
    makeController.dispose();
    modelController.dispose();
    yearController.dispose();
    colorController.dispose();
    currentController.dispose();

    // Clear file lists
    void clear(){
      vehicleFiles.clear();
      documentFiles.clear();
      uploadedVehicleFiles.clear();
      uploadedDocumentFiles.clear();

      super.onClose();
    }

  }

}
