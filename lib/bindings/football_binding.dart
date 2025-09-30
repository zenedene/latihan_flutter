import 'package:get/get.dart';
import 'package:latihan1/controllers/football_controller.dart';

class FootballBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballController>(
      () => FootballController(),
    );
  }
}