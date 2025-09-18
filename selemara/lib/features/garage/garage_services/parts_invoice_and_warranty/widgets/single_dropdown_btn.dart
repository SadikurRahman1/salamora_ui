import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../../../../core/constants/app_colors.dart';
import '../../../../../../core/constants/app_responsive.dart';
import '../../../../../../core/widgets/app_text.dart';
import '../../../../../../core/widgets/custom_text_form_field.dart';

class SingleDropdownBtn extends StatelessWidget {
  final String title2;
  final String subtitle2;
  final RxString selectedValue;
  final RxList<String> dropdownItems;


  const SingleDropdownBtn({
    super.key,
    required this.title2,
    required this.subtitle2,
    required this.selectedValue,
    required this.dropdownItems,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title2,
          color: AppColors.secondryTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(height: res.hp(8)),
        Obx(
              () =>
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.borderColor3f3),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    // ⚡ overflow fix
                    value: selectedValue.value.isEmpty ? null : selectedValue
                        .value,
                    hint: Text(
                      subtitle2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    items: dropdownItems
                        .map((item) =>
                        DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                        .toList(),
                    onChanged: (val) {
                      selectedValue.value = val ?? '';
                    },
                  ),
                ),
              ),
        ),
      ],
    );
  }
}
