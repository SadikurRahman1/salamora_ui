import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/app_text.dart';

class GarageServicesScreen extends StatelessWidget {
  const GarageServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              AppText("inProgress")
            ],
          )
        ],
      ),
    );
  }
}