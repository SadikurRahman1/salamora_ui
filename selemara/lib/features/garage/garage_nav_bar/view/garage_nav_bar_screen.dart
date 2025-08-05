import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/features/garage/garage_nav_bar/controller/garage_nav_bar_controller.dart';
import 'package:selemara/features/garage/garage_nav_bar/widget/owner_nav_bar_items.dart';

import '../../../../core/constants/app_colors.dart';

class GarageNavBarScreen extends StatelessWidget {
  const GarageNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GarageNavBarController navController =
        Get.find<GarageNavBarController>();

    return Scaffold(
      bottomNavigationBar: Obx(
        () => Container(
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha:0.1), 
                blurRadius: 10,
                spreadRadius: 1,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.backGroundColor,
              currentIndex: navController.currentIndex,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: AppColors.whitColor,
              onTap: navController.changeIndex,
              selectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
              ),
              items: List.generate(OwnerNavbarItems.activeIcons.length, (index) {
                final isActive = navController.currentIndex == index;

                return BottomNavigationBarItem(
                  label: '',
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isActive
                          ? OwnerNavbarItems.activeIcons[index]
                          : OwnerNavbarItems.inActiveIcons[index],
                      const SizedBox(height: 5),
                      Text(
                        OwnerNavbarItems.labels.length > index
                            ? OwnerNavbarItems.labels[index]
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color: isActive
                              ? AppColors.primaryColor
                              : AppColors.primaryTextColor,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
