import 'package:flutter/material.dart';

import '../../../../core/constants/app_responsive.dart';
import '../../../../core/widgets/custom_appbar.dart';

class MyCarsScreen extends StatelessWidget {
   MyCarsScreen({super.key});
  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBar(title: "My Cars"),



    );
  }
}
