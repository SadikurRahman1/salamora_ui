import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_icons.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';

import '../../profile/widget/custom_text_field.dart';
import '../controller/reminders_controller.dart';

class AddReminderScreen extends StatelessWidget {
  AddReminderScreen({super.key});

  final List<String> items = ["Soon", "Overdue", "Soon"];

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  final res = AppResponsive();
  final controller = Get.put(RemindersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Add Reminders",
        centerTitle: false,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Title",
                    color: AppColors.secondryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: res.hp(8)),
                  CustomTextField(
                    borderRadius: 24,
                    bordarColor: AppColors.borderColor3f3,
                    controller: controller.titleController,
                    hintText: "Tire Rotation",
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Subtitle",
                    color: AppColors.secondryTextColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: res.hp(8)),
                  CustomTextField(
                    borderRadius: 24,
                    bordarColor: AppColors.borderColor3f3,
                    controller: controller.subTitleController,
                    hintText: "Toyota Camry 2020",
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),
            SliverToBoxAdapter(
              child: AppText(
                "Status",
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
                  hint: Text("Status", style: TextStyle(color: Colors.grey)),
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
                "Due Date",
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

            SliverToBoxAdapter(child: SizedBox(height: res.hp(48))),

            SliverToBoxAdapter(child: CustomButton(text: "save", onTap: () {})),
          ],
        ),
      ),
    );
  }
}
