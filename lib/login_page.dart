import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/login_controller.dart';
import 'package:latihan1/widget/widget_button.dart';
import 'package:latihan1/widget/widget_textField.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome to our app!",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("Please log in to continue."),
            Center(
              child: Image.asset(
                'assets/images/arjijiji.png',
                width: 100,
                height: 100,
              ),
            ),
            SizedBox(height: 20),
            CustomTextField(
              hintText: "Username",
              controller: controller.usernameController,
              obscureText: false,
            ),
            CustomTextField(
              hintText: "Password",
              controller: controller.passwordController,
              obscureText: true,
            ),

            Center(
              child: CustomButton(
                text: "Login",
                textColor: Colors.blueAccent,
                onPressed: controller.login,
              ),
            ),
            Obx(() => Text(controller.statusLogin.value)),
            SizedBox(height: 20),
            Center(
              child: CustomButton(
                text: "Register",
                textColor: Colors.indigoAccent,
                onPressed: () {
                  Get.toNamed('/register');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
