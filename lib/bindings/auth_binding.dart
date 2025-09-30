import 'package:get/get.dart';
import 'package:latihan1/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      LoginController(),
    );
  }
}
