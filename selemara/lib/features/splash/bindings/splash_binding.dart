import 'package:get/instance_manager.dart';
import 'package:selemara/features/splash/controller/spash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
