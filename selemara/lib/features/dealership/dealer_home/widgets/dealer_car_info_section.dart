import 'package:flutter/cupertino.dart';
import 'package:selemara/features/car_owner_flow/profile/widget/custom_text_field.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/app_text.dart';

class DealerCarInfoCard extends StatelessWidget {
  final String label1;
  final String label2;
  final String hint1;
  final String hint2;
  final TextEditingController controllerA;
  final TextEditingController controllerB;

  const DealerCarInfoCard({
    super.key,
    required this.label1,
    required this.label2,
    required this.hint1,
    required this.hint2,
    required this.controllerA,
    required this.controllerB,
  });

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  label1,
                  color: AppColors.secondryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: res.hp(8)),
                CustomTextField(
                  borderRadius: 24,
                  bordarColor: AppColors.borderColor3f3,
                  controller: controllerA,
                  hintText: hint1,
                ),
              ],
            ),
          ),

          SizedBox(width: res.wp(20)),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  label2,
                  color: AppColors.secondryTextColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: res.hp(8)),
                CustomTextField(
                  borderRadius: 24,
                  bordarColor: AppColors.borderColor3f3,
                  controller: controllerB,
                  hintText: hint2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
