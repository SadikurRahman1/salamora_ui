import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text_inter.dart';
import 'package:selemara/core/widgets/background_gradient.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import 'package:selemara/features/onboarding/controller/onboarding_controller.dart';
import 'package:selemara/features/onboarding/model/onboarding_item.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      body: BackgroundGradient(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: res.hp(80)),
              SizedBox(
                height: res.hp(470),
                child: PageView.builder(
                  controller: controller.pageController,
                  itemCount: onboardingPages.length,
                  onPageChanged: controller.onPageChanged,
                  itemBuilder: (context, index) {
                    final item = onboardingPages[index];
                    return Padding(
                      padding: EdgeInsets.all(res.wp(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(res.wp(16)),
                            child: Image.asset(
                              item.imagePath,
                              width: double.infinity,
                              height: res.hp(250),
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(height: res.hp(20)),
                          // AppTextInter(
                          //   item.title,
                          //   textAlign: TextAlign.center,
                          //   fontSize: res.sp(24),
                          //   fontWeight: FontWeight.w600,
                          //   color: AppColors.textColor,
                          //   // style: TextStyle(
                          //   //   fontSize: res.sp(20),
                          //   //   fontWeight: FontWeight.bold,
                          //   // ),
                          // ),
                          SizedBox(height: res.hp(10)),
                          AppTextInter(
                            item.description,
                            textAlign: TextAlign.center,
                            color: AppColors.textColor.withValues(alpha: 0.8),
                            fontSize: res.sp(14),
                          ),
                          SizedBox(height: res.hp(10)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingPages.length, (index) {
                    final selected = controller.currentPage.value == index;
                    return AnimatedContainer(
                      duration: 300.milliseconds,
                      margin: EdgeInsets.symmetric(horizontal: res.wp(4)),
                      height: res.wp(12),
                      width: res.wp(20),
                      decoration: BoxDecoration(
                        color:
                            selected
                                ? AppColors.primaryColor
                                : AppColors.geryColor,
                        borderRadius: BorderRadius.circular(res.wp(5)),
                      ),
                    );
                  }),
                ),
              ),

              SizedBox(height: res.hp(100)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: res.wp(20)),
                child: Column(
                  children: [
                    Obx(
                      () => CustomButton(
                        onTap: controller.nextPage,
                        text:
                            controller.currentPage.value == 3
                                ? 'get_started'.tr
                                : 'next'.tr,
                      ),
                    ),
                    SizedBox(height: res.hp(10)),
                    CustomButton(
                      text: 'skip'.tr,
                      textColor: AppColors.darkBlueGrey.withValues(alpha: 0.6),
                      onTap: controller.skip,
                      isBorder: true,
                      btnColor: AppColors.skipBtnColor.withValues(alpha: 0.01),
                    ),
                    // TextButton(
                    //   onPressed: controller.skip,
                    //   child: Text('Skip', style: TextStyle(fontSize: res.sp(14))),
                    // ),
                  ],
                ),
              ),
              SizedBox(height: res.hp(20)),
            ],
          ),
        ),
      ),
    );
  }
}
