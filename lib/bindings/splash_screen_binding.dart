import 'package:get/get.dart';
import 'package:latihan1/controllers/football_controller.dart';
import 'package:latihan1/controllers/splashscreen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
      () => SplashscreenController(),
    );
  }
}