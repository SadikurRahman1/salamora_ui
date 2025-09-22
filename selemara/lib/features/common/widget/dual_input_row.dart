import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class DualInputRow extends StatelessWidget {
  final String title1;
  final String subtitle1;
  final String title2;
  final String subtitle2;
  final TextEditingController controller1;
  final TextEditingController controller2;

  const DualInputRow({
    super.key,
    required this.title1,
    required this.subtitle1,
    required this.title2,
    required this.subtitle2,
    required this.controller1,
    required this.controller2,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive(); // ধরলাম তোমার responsive ক্লাস GetX এ আছে

    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title1,
                color: AppColors.secondryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: res.hp(8)),
              CustomTextFormField(
                borderRadius: 24,
                controller: controller1,
                hintText: subtitle1,
              ),
            ],
          ),
        ),
        SizedBox(width: res.wp(20)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                title2,
                color: AppColors.secondryTextColor,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: res.hp(8)),
              CustomTextFormField(
                borderRadius: 24,
                controller: controller2,
                hintText: subtitle2,
              ),
            ],
          ),
        ),
      ],
    );
  }
}


