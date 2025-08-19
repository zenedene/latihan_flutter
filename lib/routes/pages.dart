import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/pages/football_edit_page.dart';
import 'package:latihan1/pages/football_page.dart';
import 'package:latihan1/pages/main_page.dart';
import 'package:latihan1/pages/profile_page.dart';
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
    GetPage(
      name: AppRoutes.mainPage,
      page: () => MainPage(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfilePage(),
    ),
  ];  
}