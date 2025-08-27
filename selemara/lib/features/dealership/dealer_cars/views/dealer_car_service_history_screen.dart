import 'package:flutter/material.dart';
import 'package:selemara/core/constants/app_images.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_responsive.dart';
import '../../../../../core/widgets/app_text.dart';
import '../../../../../core/widgets/custom_appbar.dart';
import 'package:get/get.dart';
import '../../common/widgets/dealer_history_card_widget.dart';
import '../widgets/car_image_card.dart';

class DealerCarServiceHistoryScreen extends StatelessWidget {
  const DealerCarServiceHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final res = AppResponsive();
    return Scaffold(
      appBar: CustomAppBar(
        title: "car_details".tr,
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: res.hp(24))),

            SliverToBoxAdapter(
              child:CarImageCard(
                imagePath: AppImages.carImage,
                title: "2018 Honda Civic",
                price: "\$20,000",
                miles: "15,420",
                services: "8",
                carColor: "Black",
                date: "2024-01-15",
                model: "IHGCV2F6JLOOOOOO",
                onContactTap: () {
                  print("Contact Seller tapped!");
                }, isPending: false,
              ),

            ),


            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: AppText(
                "Service History",
                color: AppColors.textColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SliverToBoxAdapter(child: SizedBox(height: res.hp(20))),

            SliverToBoxAdapter(
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BuyerHistoryCardWidget(
                    color: (index % 2 == 0) ? true : false,
                    title: "Oil Change & Fitter",
                    date: "6/15/2025",
                    serviceCenter: "Al Futtaim Service Center",
                    statusLabel: "Warranty",
                    invoiceLabel: "Invoice",
                    onTapOilChange: () {},
                    onTapWarranty: () {
                      // Get.to(()=> BuyerServiceHistoryDetailsScreen());
                    },
                    onTapInvoice: () {},
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        label: Row(
          children: [
            Icon(Icons.add),
            Text(
              "request_service".tr,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }



}
