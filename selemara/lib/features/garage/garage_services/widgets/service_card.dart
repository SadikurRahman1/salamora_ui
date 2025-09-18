import 'package:flutter/material.dart';
import 'package:selemara/core/constants/widget_extensions.dart';

import '../../../../core/constants/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String car;
  final String user;
  final String price;
  final String imageUrl;
  final VoidCallback? onTap;


  const ServiceCard({
    super.key,
    required this.title,
    required this.car,
    required this.user,
    required this.price,
    required this.imageUrl, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whitColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imageUrl,
                height: 90,
                width: 99,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 90,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600)),
                    // const SizedBox(height: 4),
                    Text(car,
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                    Text(user,
                        style: const TextStyle(fontSize: 14, color: Colors.grey)),
                  ],
                ),
              ),
            ),
            Text(price,
                style:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    ).onTap(onTap);
  }
}
