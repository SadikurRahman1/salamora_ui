import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/routes/app_routes.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../controller/reminders_controller.dart';
import '../widget/service_info_card.dart';

class RemindersScreen extends StatelessWidget {
  RemindersScreen({super.key});

  final res = AppResponsive();
  final controller = Get.put(RemindersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(0.0),
        child: CustomButton(
          text: "Add Reminder",
          iconPath: AppIcons.plus1,
          iconColor: AppColors.whitColor,
          iconWidth: 14,
          iconHeight: 14,
          onTap: () {
            Get.toNamed(AppRoutes.addReminderScreen);
          },
        ),
      ),
      appBar: CustomAppBar(
        title: "Reminders",
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),
                  SliverToBoxAdapter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        // Example usage of statuses
                        final status = controller.serviceStatuses[1]; // "Soon"

                        // Determine colors based on status
                        Color statusBgColor;
                        Color statusTextColor;
                        Color sideBarColor;

                        switch (status) {
                          case "Overdue":
                            statusBgColor = AppColors.orangeLight;
                            statusTextColor = AppColors.orangeDeep;
                            sideBarColor = AppColors.orangeDeep;
                            break;
                          case "Soon":
                            statusBgColor = AppColors.orangeLight;
                            statusTextColor = AppColors.orange;
                            sideBarColor = AppColors.orange;
                            break;
                          case "Upcoming":
                          default:
                            statusBgColor = Color(0xFFeaf0fd);
                            statusTextColor = AppColors.primaryColor;
                            sideBarColor = AppColors.primaryColor;
                            break;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: ServiceInfoCard(
                            title: "Oil Change Due",
                            status: status,
                            count: "2",
                            dueDate: "Jan 30, 2025",
                            statusBgColor: statusBgColor,
                            statusTextColor: statusTextColor,
                            sideBarColor: sideBarColor,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: res.hp(12)),

         // bottom padding if needed
          ],
        ),
      ),
    );
  }
}
