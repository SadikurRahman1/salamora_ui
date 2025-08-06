import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/core/widgets/app_text.dart';

class UserTypeDropdown extends StatelessWidget {
  final String? value;
  final Function(String?) onChanged;
  final AppResponsive res;

  const UserTypeDropdown({
    super.key,
    required this.value,
    required this.onChanged,
    required this.res,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: value,
      onChanged: onChanged,
      isDense: false,
      itemHeight: res.hp(48),
      alignment:AlignmentDirectional.centerStart, 
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.symmetric(
          horizontal: res.wp(16),
          vertical: res.hp(3),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: Color(0xFFF5F5F5)),
        ),
      ),
      style: const TextStyle(color: Colors.black),
      dropdownColor: Colors.white,
      hint: AppText(
        'select_user_type'.tr,
        color: AppColors.textColor.withValues(alpha: 0.5),
        fontSize: 14,
      ),
      items: [
        DropdownMenuItem(
          value: 'car_owner',
          child: AppText(
            'Car Owner',
            color: AppColors.textColor.withValues(alpha: 0.5),
            fontSize: 14,
          ),
        ),
        DropdownMenuItem(
          value: 'garage',
          child: AppText(
            'Garage',
            color: AppColors.textColor.withValues(alpha: 0.5),
            fontSize: 14,
          ),
        ),
        DropdownMenuItem(
          value: 'dealership',
          child: AppText(
            'Dealership',
            color: AppColors.textColor.withValues(alpha: 0.5),
            fontSize: 14,
          ),
        ),
        DropdownMenuItem(
          value: 'buyer',
          child: AppText(
            'Buyer',
            color: AppColors.textColor.withValues(alpha: 0.5),
          ),
        ),
      ],
    );
  }
}
