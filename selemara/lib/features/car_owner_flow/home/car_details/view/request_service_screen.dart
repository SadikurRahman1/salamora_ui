import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/app_text.dart';

import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../../../core/widgets/custom_button.dart';
import '../../../profile/widget/custom_text_field.dart';
import '../controller/request_service_controller.dart';
import '../../widget/car_info_section.dart';

class RequestServiceScreen extends StatelessWidget {
  RequestServiceScreen({super.key});

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  final controller = Get.put(RequestServiceController());

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    final List<String> items = ['Option 1', 'Option 2', 'Option 3'];

    return Scaffold(
      appBar: CustomAppBar(
        title: "Request Service",
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  AppText(
                    "Garage/Service Center Name ",
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
                  value: controller.selected.value,
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
                  style: TextStyle(
                    color: Colors.grey, // Selected text color gray
                    fontSize: 16,
                  ),
                  hint: Text(
                    "Enter garage name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  items:
                      items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: AppText(
                                e,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor,
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.changeSelection(val);
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Row(
                children: [
                  AppText(
                    "Service Type ",
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
                  value: controller.selected.value,
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
                  style: TextStyle(
                    color: Colors.grey, // Selected text color gray
                    fontSize: 16,
                  ),
                  hint: Text(
                    "Enter garage name",
                    style: TextStyle(color: Colors.grey),
                  ),
                  items:
                      items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: AppText(
                                e,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor,
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.changeSelection(val);
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            CarInfoSection(
              controllerA: controller.phoneController,
              controllerB: controller.emailController,
              label1: "Phone Number",
              label2: "Email",
              hint1: "2024",
              hint2: "Silver",
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: AppText(
                "Urgency Level ",
                fontWeight: FontWeight.w600,
                color: AppColors.textColor,
                fontSize: 14,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(8))),

            SliverToBoxAdapter(
              child: Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.selected.value,
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
                  style: TextStyle(
                    color: Colors.grey, // Selected text color gray
                    fontSize: 16,
                  ),
                  hint: Text(
                    "Medium - Within a week",
                    style: TextStyle(color: Colors.grey),
                  ),
                  items:
                      items
                          .map(
                            (e) => DropdownMenuItem(
                              value: e,
                              child: AppText(
                                e,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textColor,
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    controller.changeSelection(val);
                  },
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: AppText(
                "Preferred Date ",
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
                    date != null ? _formatDate(date) : "Select Date";

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
                              color: date != null ? Colors.black : Colors.grey,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
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
                "Service Description",
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
                hintText:
                    "Describe the service needed, any symptoms, or specific requirements„-",
              ),
            ),


            SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),


            SliverToBoxAdapter(
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      btnColor: Color(0xFFF5F5F5),
                      text: "Cancel",
                      onTap: () {},
                      textColor: Color(0xFFACACAC),
                    ),
                  ),

                  SizedBox(width: res.wp(20)),
                  Expanded(
                    child: CustomButton(text: "Submit", onTap: () {}),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),



          ],
        ),
      ),
    );
  }
}
