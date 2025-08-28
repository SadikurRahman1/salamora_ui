import 'package:flutter/material.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';

class DateFieldCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextEditingController controller;

  const DateFieldCard({
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
        GestureDetector(
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );

            if (pickedDate != null) {
              controller.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
            }
          },
          child: AbsorbPointer(
            child: CustomTextFormField(
              controller: controller,
              hintText: subtitle,
              suffixIcon: const Icon(Icons.calendar_today),
            ),
          ),
        ),
      ],
    );
  }
}
