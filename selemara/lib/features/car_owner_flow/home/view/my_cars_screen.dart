import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/custom_button.dart';

import '../../../../core/constants/app_images.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';
import '../../../../core/widgets/custom_appbar.dart';

class MyCarsScreen extends StatelessWidget {
  MyCarsScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "My Cars",
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  AppText(
                    "My All Cars",
                    color: AppColors.textColor2B2B,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),

                  SizedBox(
                    width: res.wp(128),
                    child: CustomButton(
                      text: "Add Vehicle ",
                      onTap: () {},

                      iconPath: AppIcons.plus1,
                    ),
                  ),
                ],
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(AppImages.carImage, fit: BoxFit.cover),
                    ),

                    Padding(padding: EdgeInsets.only(top: 20)),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                "2020 Honda Civic",
                                color: AppColors.textColor2A2A,
                                fontSize: 24,
                                fontWeight: FontWeight.w600,
                              ),
                              Padding(padding: EdgeInsets.only(top: 4)),

                              Row(
                                children: [
                                  AppText(
                                    "Silver",
                                    color: AppColors.textColor626,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),

                                  Padding(padding: EdgeInsets.only(left: 8)),
                                  Container(
                                    height: res.wp(8),
                                    width: res.wp(8),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

                                      color: AppColors.bordarColor,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(left: 8)),

                                  AppText(
                                    "45,000 miles",
                                    color: AppColors.textColor626,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: const Color(0xFFe6f6f1),
                              borderRadius: BorderRadius.circular(res.sp(4)),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color(0x1AF0F4FD),
                                  blurRadius: 3.0,
                                  spreadRadius: 1.0,
                                  offset: const Offset(2, 2),
                                ),
                              ],
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(res.sp(4)),
                              child: Image.asset(
                                AppIcons.model,
                                height: res.hp(32),
                                width: res.wp(32),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top: 16)),

                    _labelValueRow("VIN:", "CV2F6JLOOOOOO"),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("Last Service:", "1/15/2024"),
                    Padding(padding: EdgeInsets.only(top: 8)),

                    _labelValueRow("Next Service:", "4/15/2024"),
                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("Service Records:", "8"),

                    Padding(padding: EdgeInsets.only(top: 8)),
                    _labelValueRow("Documents:", "2 uploaded"),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: res.hp(16))),

            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(16),

                decoration: BoxDecoration(
                  color: AppColors.whitColor,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 4.0,
                      spreadRadius: 0.5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(AppImages.carImage, fit: BoxFit.cover),
                ),
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),
            // Your slivers go here
          ],
        ),
      ),
    );
  }

  Row _labelValueRow(String kye, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.topLeft,
            child: AppText(
              kye,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Align(
            alignment: Alignment.topRight,
            child: AppText(
              value,
              color: AppColors.textColor626,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
