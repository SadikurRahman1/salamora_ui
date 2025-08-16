import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/constants/app_colors.dart';
import '../controller/buyer_nav_bar_controller.dart';
import '../widget/buyer_nav_bar_items.dart';

class BuyerNauBarScreen extends StatelessWidget {
  const BuyerNauBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BuyerNavBarController navController =
        Get.find<BuyerNavBarController>();

    return Scaffold(
      body: Obx(
        () => BuyerNavBarItems.screens[navController.currentIndex.value],
      ),
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
                color: Colors.black.withValues(alpha: 0.1),
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
              currentIndex: navController.currentIndex.value,
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
              items: List.generate(BuyerNavBarItems.activeIcons.length, (
                index,
              ) {
                final isActive = navController.currentIndex.value == index;

                return BottomNavigationBarItem(
                  
                  label: '',
                  icon: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      isActive
                          ? BuyerNavBarItems.activeIcons[index]
                          : BuyerNavBarItems.inActiveIcons[index],
                      const SizedBox(height: 5),
                      Text(
                        BuyerNavBarItems.labels.length > index
                            ? BuyerNavBarItems.labels[index]
                            : '',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                          color:
                              isActive
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
