import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/football_edit_page.dart';
import 'package:latihan1/pages/football_page.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:latihan1/pages/calculator_page.dart';
class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
    ),
    GetPage(
      name: AppRoutes.footballPlayers,
      page: () => FootballPage(),
    ),
    GetPage(
      name: AppRoutes.footballEdit,
      page: () => FootballEditPage(),
    ),
  ];  
}