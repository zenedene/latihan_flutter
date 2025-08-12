import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/calculator_controller.dart';
import 'package:latihan1/widget/widget_button.dart';
import 'package:latihan1/widget/widget_textField.dart';

class CalculatorPage extends StatelessWidget {
  CalculatorPage({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculator Page")),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Calculator Page",
              style: TextStyle(
                fontSize: 20,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Gunakan controller dari CalculatorController
            CustomTextField(
              hintText: "Angka pertama",
              controller: calculatorController.numberOneController,
              obscureText: false,
            ),
            CustomTextField(
              hintText: "Angka kedua",
              controller: calculatorController.numberTwoController,
              obscureText: false,
            ),

            const SizedBox(height: 20),

            Row(
              children: [
                CustomButton(
                  text: "+",
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    calculatorController.calculate(
                      "+",
                      calculatorController.numberOneController.text,
                      calculatorController.numberTwoController.text,
                    );
                  },
                ),
                CustomButton(
                  text: "-",
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    calculatorController.calculate(
                      "-",
                      calculatorController.numberOneController.text,
                      calculatorController.numberTwoController.text,
                    );
                  },
                ),
              ],
            ),
            Row(
              children: [
                CustomButton(
                  text: "/",
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    calculatorController.calculate(
                      "/",
                      calculatorController.numberOneController.text,
                      calculatorController.numberTwoController.text,
                    );
                  },
                ),
                CustomButton(
                  text: "*",
                  textColor: Colors.blueAccent,
                  onPressed: () {
                    calculatorController.calculate(
                      "*",
                      calculatorController.numberOneController.text,
                      calculatorController.numberTwoController.text,
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 20),

            Obx(() {
              return Text(
                "Hasil: ${calculatorController.result.value}",
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
