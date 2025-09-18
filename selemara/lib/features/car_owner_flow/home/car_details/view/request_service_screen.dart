import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../profile/widget/custom_text_field.dart';
import '../../widget/car_info_section.dart';
import '../controller/request_service_controller.dart';

class RequestServiceScreen extends StatelessWidget {
  RequestServiceScreen({super.key});

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  final RequestServiceController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "request_service".tr,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: Obx(() {
          return controller.allGarageList.value != null
              ? Center(child: CircularProgressIndicator())
              : CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        AppText(
                          "garage_service_center_name".tr,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ),
                        AppText(
                          "*",
                          fontWeight: FontWeight.w600,
                          color: AppColors.orangeDeep,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

                  SliverToBoxAdapter(
                    child: Obx(
                      () => DropdownSearch<String>(
                        items: controller.garageNameList,
                        selectedItem:
                            controller.garageNameList.contains(
                                  controller.selected.value,
                                )
                                ? controller.selected.value
                                : null,

                        // Changed to null instead of string
                        popupProps: PopupProps.menu(
                          showSearchBox: true,
                          searchFieldProps: TextFieldProps(
                            decoration: InputDecoration(
                              hintText: "Search garage...",
                              prefixIcon: Icon(
                                Icons.search,
                                color: Colors.grey,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                            ),
                          ),
                          menuProps: MenuProps(
                            backgroundColor: Colors.white,
                            elevation: 4,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),

                        dropdownDecoratorProps: DropDownDecoratorProps(
                          dropdownSearchDecoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                            ),
                            hintText: "enter_garage_name".tr,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ), // Gray hint text
                          ),
                        ),

                        // Add this to make dropdown icon gray
                        dropdownButtonProps: DropdownButtonProps(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.grey, // Gray dropdown icon
                          ),
                        ),

                        dropdownBuilder: (context, selectedItem) {
                          // Check if item is selected or not
                          bool isItemSelected =
                              selectedItem != null &&
                              controller.garageNameList.contains(selectedItem);

                          return AppText(
                            selectedItem ?? "enter_garage_name".tr,
                            // Show hint when null
                            fontSize: 14,
                            color: isItemSelected ? Colors.black : Colors.grey,
                            // Gray for placeholder, black for selected
                            fontWeight: FontWeight.w400,
                          );
                        },

                        onChanged: controller.changeSelection,
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        AppText(
                          "service_type".tr,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textColor,
                          fontSize: 14,
                        ),
                        AppText(
                          "*",
                          fontWeight: FontWeight.w600,
                          color: AppColors.orangeDeep,
                          fontSize: 14,
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

                  SliverToBoxAdapter(
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.selectedService.value,
                        // ekta selected value
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.grey,
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                        hint: Text(
                          "enter_service_type".tr,
                          style: TextStyle(color: Colors.grey),
                        ),
                        items:
                            controller.serviceTypeList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: AppText(
                                      e,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => controller.changeSelectionItem(val),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

                  CarInfoSection(
                    controllerA: controller.phoneController,
                    controllerB: controller.emailController,
                    label1: "Phone Number".tr, // VIN
                    label2: "Email".tr, // Car Name
                    hint1: "+113289078".tr, // Car Owner
                    hint2: "Enter your email",
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

                  SliverToBoxAdapter(
                    child: AppText(
                      "urgency_level".tr,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      fontSize: 14,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

                  SliverToBoxAdapter(
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        // initialValue: controller.selectedLevel.value,
                        value: controller.selectedLevel.value,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                          ),
                        ),
                        dropdownColor: Colors.white,
                        iconEnabledColor: Colors.grey,
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                        hint: Text(
                          "enter_service_type".tr,
                          style: TextStyle(color: Colors.grey),
                        ),
                        items:
                            controller.urgencyList
                                .map(
                                  (e) => DropdownMenuItem(
                                    value: e,
                                    child: AppText(
                                      e,
                                      fontWeight: FontWeight.w400,
                                      color: AppColors.textColor,
                                      fontSize: 14,
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (val) => controller.changeLevel(val),
                      ),
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

                  SliverToBoxAdapter(
                    child: AppText(
                      "preferred_date".tr,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      fontSize: 14,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

                  SliverToBoxAdapter(
                    child: Obx(() {
                      final date = controller.selectedDate.value;
                      final displayText =
                          date != null ? _formatDate(date) : "select_date".tr;

                      return InkWell(
                        borderRadius: BorderRadius.circular(24),
                        onTap: () => controller.pickDate(context),
                        child: InputDecorator(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(24),
                              borderSide: BorderSide(color: Color(0xFFF3F3F3)),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  displayText,
                                  style: TextStyle(
                                    color:
                                        date != null
                                            ? Colors.black
                                            : Colors.grey,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              Image.asset(
                                AppIcons.calendar,
                                height: res.hp(20),
                                width: res.wp(20),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

                  SliverToBoxAdapter(
                    child: AppText(
                      "service_description".tr,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                      fontSize: 14,
                    ),
                  ),
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

                  SliverToBoxAdapter(
                    child: CustomTextField(
                      maxLine: 2,
                      minLine: 1,
                      borderRadius: 4,
                      bordarColor: AppColors.borderColor3f3,
                      controller: controller.descriptionController,
                      hintText: "describe_service_hint".tr,
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),

                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            btnColor: Color(0xFFF5F5F5),
                            text: "cancel".tr,
                            onTap: () {},
                            textColor: Color(0xFFACACAC),
                          ),
                        ),

                        SizedBox(width: res.wp(20)),

                        Expanded(
                          child: CustomButton(
                            btnColor: AppColors.black,
                            text: "submit".tr,
                            onTap: () {
                              controller.postRequestService();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),
                ],
              );
        }),
      ),
    );
  }
}
