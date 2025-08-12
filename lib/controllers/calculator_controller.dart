import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorController extends GetxController {
  final numberOneController = TextEditingController();
  final numberTwoController = TextEditingController();
  var result = ''.obs;

  void calculate(String operation, String numberOne, String numberTwo) {
    double num1 = double.tryParse(numberOne) ?? 0;
    double num2 = double.tryParse(numberTwo) ?? 0;

    switch (operation) {
      case '+':
        result.value = (num1 + num2).toString();
        break;
      case '-':
        result.value = (num1 - num2).toString();
        break;
      case '*':
        result.value = (num1 * num2).toString();
        break;
      case '/':
        if (num2 != 0) {
          result.value = (num1 / num2).toString();
        } else {
          result.value = 'Error: Division by zero';
        }
        break;
      default:
        result.value = 'Invalid operation';
    }
  }
}