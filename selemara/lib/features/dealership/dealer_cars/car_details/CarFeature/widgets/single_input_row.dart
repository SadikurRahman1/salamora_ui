import 'package:flutter/cupertino.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class SingleInputField extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;

  const SingleInputField({
    super.key,
    required this.title,
    required this.subtitle,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          color: AppColors.secondryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: res.hp(8)),
        CustomTextFormField(
          borderRadius: 24,
          controller: controller,
          hintText: subtitle,
        ),
      ],
    );
  }
}
