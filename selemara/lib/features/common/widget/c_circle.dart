import 'package:flutter/material.dart';

import '../../../core/constants/app_responsive.dart';

class CCircle extends StatelessWidget {

  final Color color;
  final double size;

  CCircle({
    super.key,
    required this.color,
    this.size = 8,
  });

  final res = AppResponsive();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: res.wp(size),
      height: res.wp(size),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
