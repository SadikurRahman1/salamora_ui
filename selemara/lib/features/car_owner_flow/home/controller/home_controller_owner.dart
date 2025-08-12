import 'package:get/get.dart';
import 'package:selemara/core/constants/api_urls.dart';

import '../../../../core/services/network_caller.dart';
import '../../../../core/services/response_data.dart';

class HomeControllerOwner extends GetxController {
  Future<void> getProfile() async {
    var url = ApiUrls.getProfile;

    ResponseData responseData = await NetworkCaller().getRequest(url);

    if (responseData.isSuccess) {



    }
    else{


    }
  }
}
