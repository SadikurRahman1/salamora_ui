import 'package:flutter/material.dart';
import 'package:selemara/core/widgets/app_text.dart';

class InformationCard extends StatelessWidget {
  final Color backgroundColor;
  final String iconPath;
  final String title;
  final String value;

  final double height;
  final double iconSize;

  const InformationCard({
    super.key,
    required this.backgroundColor,
    required this.iconPath,
    required this.title,
    required this.value,
    this.height = 67,     // Default height
    this.iconSize = 32,   // Default icon size
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Stack(
      children: [
        // Background layer shifted left to peek on the right
        Transform.translate(
          offset: const Offset(-5, 0),
          child: Container(
            height: height,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),

        // Foreground card
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 12,
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text content
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    title,

                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                      color: Color(0xFF626262),

                  ),
                  AppText(
                    value,

                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Color(0xFF626262),

                  ),
                ],
              ),

              // Icon
              Image.asset(
                iconPath,
                height: iconSize,
                width: iconSize,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
