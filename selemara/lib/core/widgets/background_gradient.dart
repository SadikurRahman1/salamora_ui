import 'package:flutter/material.dart';

class BackgroundGradient extends StatelessWidget {
  final Widget? child;

  const BackgroundGradient({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF2563EB).withValues(alpha: 0.2),
            Color(0xFF00A16E).withValues(alpha: 0.3), // green
          ],
          stops: [0.0, 0.8],
          begin: Alignment.topLeft,
          end: Alignment.bottomLeft,
        ),
      ),
      child: child,
    );
  }
}
