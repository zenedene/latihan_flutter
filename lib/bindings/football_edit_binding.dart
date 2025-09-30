import 'package:get/get.dart';
import 'package:latihan1/controllers/football_edit_controller.dart';

class FootballEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FootballEditController>(
      () => FootballEditController(),
    );
  }
}