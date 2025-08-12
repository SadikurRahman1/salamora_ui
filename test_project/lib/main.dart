import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    home: RotateScreen(),
  ));
}

class RotateController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var totalTurns = 0.0.obs; // observable variable

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  void rotate() {
    totalTurns.value += 1; // 360 degree ঘুরানোর জন্য
    animationController.forward(from: 0);
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }
}

class RotateScreen extends StatelessWidget {
  final RotateController controller = Get.put(RotateController());

  RotateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rotate Example")),
      body: Center(
        child: Column(
          children: [
            AnimatedBuilder(
              animation: controller.animationController,
              builder: (context, child) {
                return Obx(() {
                  final angle = (controller.animationController.value +
                      controller.totalTurns.value -
                      1) *
                      2.0 *
                      pi;
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001) // 3D effect
                      ..rotateY(angle),
                    child: Container(
                      width: 200,
                      height: 300,
                      color: Colors.blue,
                      alignment: Alignment.center,
                      child: const Text(
                        "Rotate Me",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  );
                });
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.rotate,
        child: const Icon(Icons.rotate_right),
      ),
    );
  }
}
