import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:selemara/features/car_owner_flow/home/car_details/controller/service_history_controller.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_icons.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/routes/app_routes.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../view/invoice_details_screen.dart';
import '../../widget/service_card.dart';

class ServiceHistoryScreen extends StatelessWidget {
  ServiceHistoryScreen({super.key});

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  final res = AppResponsive();
  final ServiceHistoryController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();

    return Scaffold(
      appBar: CustomAppBar(
        title: "service_history".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

                SliverToBoxAdapter(
                  child: AppText(
                    "honda_civic_2020_service_history".tr,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textColor2A2A,
                    fontSize: 20,
                  ),
                ),

                SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

                SliverToBoxAdapter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: res.hp(16)),
                        child: ServiceCard(
                          onTapInvoice: () async {
                            final data =
                                await InvoiceApiService.fetchInvoiceData(
                                  "#ARZ324-01",
                                );

                            Get.to(
                              () => InvoiceDetailsScreen(invoiceData: data),
                            );
                          },
                          onTapOilChange: () {
                            _showBeautifulBottomSheet(context);
                          },
                          onTapWarranty: () {
                            Get.toNamed(AppRoutes.warrantyDetailsScreen);
                          },
                          color: (index % 2 == 0) ? true : false,
                          title: "oil_change_filter".tr,
                          date: "6/15/2025",
                          serviceCenter: "al_futtaim_service_center".tr,
                          companyName: "warranty".tr,
                          invoiceLabel: "invoice".tr,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            bottom: res.hp(100),
            right: 30,
            child: SizedBox(
              width: res.wp(152),
              child: CustomButton(
                textIconWidth: 4,
                text: "request_service".tr,
                onTap: () {
                  Get.toNamed(AppRoutes.requestServiceScreen);
                },
                fontSize: 14,
                iconWidth: res.wp(13),
                iconHeight: res.wp(11),
                btnColor: AppColors.primaryColor1,
                iconPath: AppIcons.plus1,
                iconColor: AppColors.whitColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showBeautifulBottomSheet(BuildContext context) {
    final res = AppResponsive();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Image.asset(
                          AppIcons.cross,
                          height: res.hp(24),
                          width: res.wp(24),
                        ),
                      ),
                    ),

                    SizedBox(height: res.hp(24)),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          "oil_change_filter".tr,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: AppColors.textColor2A2A,
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 3,
                          ),
                          decoration: BoxDecoration(
                            color: AppColors.greenColor,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: AppText(
                            "6/15/2025",
                            color: AppColors.whitColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(17)),

                    AppText(
                      "oil_change_description".tr,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: AppColors.primaryColor1,
                    ),

                    SizedBox(height: res.hp(10)),

                    Row(
                      children: [
                        Image.asset(
                          AppIcons.calendar,
                          height: res.hp(16),
                          width: res.wp(24),
                          color: AppColors.primaryColor1,
                        ),
                        SizedBox(width: res.wp(3)),
                        AppText(
                          "service_date_example".tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.primaryColor1,
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(12)),

                    Row(
                      children: [
                        Image.asset(
                          AppIcons.map,
                          height: res.hp(16),
                          width: res.wp(24),
                          color: AppColors.primaryColor1,
                        ),
                        SizedBox(width: res.wp(3)),
                        AppText(
                          "al_futtaim_service_center".tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.primaryColor1,
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(12)),

                    Row(
                      children: [
                        Image.asset(
                          AppIcons.download,
                          height: res.hp(16),
                          width: res.wp(24),
                          color: AppColors.primaryColor1,
                        ),
                        SizedBox(width: res.wp(3)),
                        AppText(
                          "download_invoice".tr,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: AppColors.primaryColor1,
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(12)),

                    AppText(
                      '\$65.99',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: AppColors.primaryColor1,
                    ),

                    SizedBox(height: res.hp(12)),

                    Row(
                      children: [
                        AppText(
                          "your_rating".tr,
                          color: AppColors.textColor2A2A,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(width: res.wp(8)),
                        Obx(
                          () => RatingBar.builder(
                            initialRating: controller.rating.value,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: res.wp(20),
                            itemBuilder:
                                (_, __) => const Icon(
                                  Icons.star,
                                  color: Color(0xFFFACC15),
                                ),
                            onRatingUpdate: (newRating) {
                              controller.rating.value = newRating;
                            },
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: res.hp(43)),

                    // ✅ Button to open another bottom sheet
                    CustomButton(
                      text: "re_service".tr,
                      onTap: () {
                        Navigator.of(
                          context,
                        ).pop(); // close current bottom sheet

                        Future.delayed(const Duration(milliseconds: 200), () {
                          _showSecondBottomSheet(
                            context,
                          ); // open new bottom sheet
                        });
                      },
                      btnColor: AppColors.primaryColor1,
                    ),

                    SizedBox(height: res.hp(43)),
                  ],
                ),
              ),
            ),
          ),
    );
  }

  /// Second bottom sheet
  void _showSecondBottomSheet(BuildContext context) {
    final RxList<bool> isChecked = List.generate(5, (_) => false).obs;
    final List<String> options = [
      "Oil Change & Filter",
      "AC Service",
      "Brake Inspection",
      "Engine Checkup",
    ];
    final res = AppResponsive();
    final controller = Get.find<ServiceHistoryController>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 24,
              bottom: MediaQuery.of(context).viewInsets.bottom + 24,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Close Button
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Image.asset(
                        AppIcons.cross,
                        height: res.hp(24),
                        width: res.wp(24),
                      ),
                    ),
                  ),

                  SizedBox(height: res.hp(16)),

                  /// Reservice Type Label
                  Row(
                    children: [
                      AppText(
                        "Reservice Type".tr,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textColor,
                        fontSize: 14,
                      ),
                      AppText(
                        " * ".tr,
                        fontWeight: FontWeight.w600,
                        color: AppColors.red,
                        fontSize: 14,
                      ),
                    ],
                  ),

                  SizedBox(height: res.hp(8)),

                  /// Reservice Type Dropdown
                  Obx(
                    () => DropdownButtonFormField<String>(
                      value: controller.selectedLevel.value,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                            color: Color(0xFFF3F3F3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                            color: Color(0xFFF3F3F3),
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      hint: Text(
                        "Full Services".tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      items:
                          controller.serviceTypeList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: AppText(
                                    e,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (val) => controller.changeLevel(val),
                    ),
                  ),

                  SizedBox(height: res.hp(16)),

                  /// Urgency Level Label
                  AppText(
                    "Urgency Level".tr,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    fontSize: 14,
                  ),

                  SizedBox(height: res.hp(8)),

                  /// Urgency Level Dropdown
                  Obx(
                    () => DropdownButtonFormField<String>(
                      // initialValue: controller.selectedLevel.value,
                      value:controller.selectedLevel.value,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                            color: Color(0xFFF3F3F3),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                          borderSide: const BorderSide(
                            color: Color(0xFFF3F3F3),
                          ),
                        ),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(Icons.arrow_drop_down, color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                      hint: Text(
                        "Medium - Within a week".tr,
                        style: const TextStyle(color: Colors.grey),
                      ),
                      items:
                          controller.urgencyList
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: AppText(
                                    e,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.textColor,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                              .toList(),
                      onChanged: (val) => controller.changeLevel(val),
                    ),
                  ),

                  SizedBox(height: res.hp(16)),

                  /// Preferred Date Label
                  AppText(
                    "preferred_date".tr,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textColor,
                    fontSize: 14,
                  ),

                  SizedBox(height: res.hp(8)),

                  /// Date Picker
                  Obx(() {
                    final date = controller.selectedDate.value;
                    final displayText =
                        date != null ? _formatDate(date) : "select_date".tr;

                    return InkWell(
                      borderRadius: BorderRadius.circular(24),
                      onTap: () => controller.pickDate(context),
                      child: InputDecorator(
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color(0xFFF3F3F3),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: const BorderSide(
                              color: Color(0xFFF3F3F3),
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                displayText,
                                style: TextStyle(
                                  color:
                                      date != null ? Colors.black : Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Image.asset(
                              AppIcons.calendar,
                              height: res.hp(20),
                              width: res.wp(20),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                  SizedBox(height: res.hp(16)),
                  AppText(
                    "Parts Name",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: AppColors.textColor,
                  ),

                  SizedBox(height: res.hp(8)),

                  Obx(
                    () => Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(options.length, (index) {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              activeColor: AppColors.black,
                              value: isChecked[index],
                              onChanged: (val) {
                                isChecked[index] = val ?? false;
                              },
                              materialTapTargetSize:
                                  MaterialTapTargetSize.shrinkWrap,
                              // ✅ remove extra padding
                              visualDensity:
                                  VisualDensity
                                      .compact, // ✅ reduce space around checkbox
                            ),
                            Text(
                              options[index],
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(width: 12),
                          ],
                        );
                      }),
                    ),
                  ),

                  SizedBox(height: res.hp(8)),
                  CustomButton(
                    text: "submit".tr,
                    onTap: () {},
                    btnColor: AppColors.black,
                  ),

                  SizedBox(height: res.hp(24)),
                ],
              ),
            ),
          ),
    );
  }
}
