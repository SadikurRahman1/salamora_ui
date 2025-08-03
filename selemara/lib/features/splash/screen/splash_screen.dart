import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:selemara/core/constants/app_colors.dart';
import 'package:selemara/core/constants/app_responsive.dart';
import 'package:selemara/features/onboarding/widgets/background_gradient.dart';
import 'package:selemara/features/splash/controller/spash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive();
    Get.find<SplashController>();
    return Scaffold(
      body: BackgroundGradient(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(),
              Image.asset(
                "assets/images/car_clowd.png",
                width: responsive.wp(236),
                height: responsive.hp(120),
                fit: BoxFit.cover,
              ),
              // SizedBox(height: responsive.hp(40),),
              SpinKitFadingCircle(
                size: 50,
                itemBuilder: (BuildContext context, int index) {
                  final isEven = index.isEven;

                  return Transform.scale(
                    scale: isEven ? 1.0 : 1.2,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primaryColor,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
