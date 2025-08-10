import 'package:flutter/material.dart';

import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_appbar.dart';

class InvoiceDetailsScreen extends StatelessWidget {
  InvoiceDetailsScreen({super.key});

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Invoice Details",
        centerTitle: false,
        leading: Icon(Icons.arrow_back_ios, size: res.wp(24)),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: res.wp(24)),
        child: CustomScrollView(
          slivers: [SliverToBoxAdapter(child: SizedBox(height: res.hp(32))),

          ],
        ),
      ),
    );
  }
}
