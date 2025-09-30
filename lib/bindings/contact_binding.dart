import 'package:get/get.dart';
import 'package:latihan1/controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      ContactController(),
    );
  }
}
