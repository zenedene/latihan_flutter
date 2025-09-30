import 'package:get/get.dart';
import 'package:latihan1/controllers/calculator_controller.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      CalculatorController(),
    );
  }
}
