// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:selemara/core/constants/app_colors.dart';
//
// class GarageServiceController extends GetxController
//     with GetSingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void onInit() {
//     super.onInit();
//     tabController = TabController(length: 2, vsync: this);
//     tabController.addListener(() {
//       update();
//     });
//   }
//
//   Color getTabColor(int index) {
//     if (tabController.index == index) {
//       if (index == 0) return AppColors.yallowColor;
//       if (index == 1) return AppColors.greenColor;
//     }
//     return AppColors.textColor;
//   }
//
//   Color getIndicatorColor() {
//     if (tabController.index == 0) return AppColors.yallowColor;
//     if (tabController.index == 1) return AppColors.greenColor;
//     return AppColors.textColor;
//   }
//
//   @override
//   void onClose() {
//     tabController.dispose();
//     super.onClose();
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';

class GarageServiceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      update();
    });
  }

  Color getTabColor(int index) {
    if (tabController.index != index) return AppColors.textColor;
    return index == 0 ? AppColors.yallowColor : AppColors.greenColor;
  }

  Color getIndicatorColor() {
    return tabController.index == 0
        ? AppColors.yallowColor
        : AppColors.greenColor;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}
