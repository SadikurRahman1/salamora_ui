import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/features/car_owner_flow/car_owner_nevbar/controller/owner_navbar_controller.dart';

import '../../../../core/constants/app_colors.dart';
class OwnerNavbarScreen extends StatelessWidget {
  OwnerNavbarScreen({super.key}) {



    Get.put(OwnerNavbarController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<OwnerNavbarController>(
        builder: (creatorNavController) =>
        creatorNavController.screens[creatorNavController.currentIndex],
      ),
      bottomNavigationBar: GetX<OwnerNavbarController>(
        builder: (navController) {
          return Container(
            padding: const EdgeInsets.only(
              left: 18,
              right: 1,
              top: 12,
              bottom: 1,
            ),
            decoration: BoxDecoration(
              color: AppColors.backGroundColor,
              boxShadow: [
                // BoxShadow(
                //   color: AppColors.navbarShadow,
                //   spreadRadius: 4,
                //   blurRadius: 4,
                //   offset: Offset(0, 0),
                // ),
              ],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                hoverColor: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6),
                  topRight: Radius.circular(6),
                ),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.backGroundColor,
                  currentIndex: navController.currentIndex,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: AppColors.whitColor,
                  onTap: navController.changeIndex,
                  items: List.generate(navController.activeIcons.length, (
                      index,
                      ) {
                    final isActive = navController.currentIndex == index;

                    return BottomNavigationBarItem(
                      label: '', // We hide default label
                      icon: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          isActive
                              ? navController.activeIcons[index]
                              : navController.inActiveIcons[index],
                          const SizedBox(height: 5), // Vertical space
                          Text(
                            navController.labels.length > index
                                ? navController.labels[index]
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
                  selectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
