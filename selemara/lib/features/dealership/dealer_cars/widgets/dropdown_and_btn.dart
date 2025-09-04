import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_icons.dart';
import 'package:selemara/core/widgets/custom_button.dart';
import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';

class DropdownAndBtn extends StatelessWidget {
  // Dropdown
  final String subtitle;
  final RxString selectedValue;
  final RxList<String> dropdownItems;

  // Button
  final String buttonText;
  final VoidCallback onButtonTap;
  final String? buttonIconPath;
  final Color? buttonColor;
  final Color? buttonTextColor;

  const DropdownAndBtn({
    super.key,
    required this.subtitle,
    required this.selectedValue,
    required this.dropdownItems,
    required this.buttonText,
    required this.onButtonTap,
    this.buttonIconPath,
    this.buttonColor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Row(
      children: [
        // Dropdown
        Flexible(
          flex: 1,
          child: Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.borderColor3f3),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value:
                      dropdownItems.contains(selectedValue.value)
                          ? selectedValue.value
                          : null,
                  // ⚡ safe selected value
                  hint: Text(subtitle, overflow: TextOverflow.ellipsis),
                  items:
                      dropdownItems
                          .map(
                            (item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                  onChanged: (val) {
                    selectedValue.value = val ?? '';
                  },
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: res.wp(10)),

        // Button
        Flexible(
          flex: 1,
          child: CustomButton(
            text: buttonText,
            onTap: onButtonTap,
            iconPath: buttonIconPath ?? AppIcons.plus,
            btnColor: buttonColor ?? AppColors.primaryColor1,
            iconColor: buttonTextColor ?? AppColors.whitColor,
          ),
        ),
      ],
    );
  }
}
