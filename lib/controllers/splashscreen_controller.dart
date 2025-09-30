import 'package:get/get.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    checklogin();
  }

  checklogin() async {
    await Future.delayed(const Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final savedUser = prefs.getString("username");

    if (savedUser != null) {
      Get.offAllNamed(AppRoutes.mainPage);
    } else {
      Get.offAllNamed(AppRoutes.loginPage);
    }
    ;
  }
}
