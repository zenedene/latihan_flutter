import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var statusLogin = 'Please login to continue'.obs;

  void login() {
    final username = usernameController.text;
    final password = passwordController.text;

    if (username == 'admin' && password == '123') {
      statusLogin.value = 'Login successful!';
      Get.toNamed('/mainPage');
    } else {
      statusLogin.value = 'Invalid username or password.';
    }
  }
}
