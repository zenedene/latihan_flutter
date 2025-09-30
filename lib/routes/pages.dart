import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/bindings/auth_binding.dart';
import 'package:latihan1/bindings/calculator_binding.dart';
import 'package:latihan1/bindings/football_binding.dart';
import 'package:latihan1/bindings/football_edit_binding.dart';
import 'package:latihan1/bindings/splash_screen_binding.dart';
import 'package:latihan1/login_page.dart';
import 'package:latihan1/pages/contact_page.dart';
import 'package:latihan1/pages/football_edit_page.dart';
import 'package:latihan1/pages/football_page.dart';
import 'package:latihan1/pages/main_page.dart';
import 'package:latihan1/pages/profile_page.dart';
import 'package:latihan1/pages/splash_screen_page.dart';
import 'package:latihan1/routes/routes.dart';
import 'package:latihan1/pages/calculator_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.calculator,
      page: () => CalculatorPage(),
      binding: CalculatorBinding(),
    ),
    GetPage(
      name: AppRoutes.footballPlayers,
      page: () => FootballPage(),
      binding: FootballBinding(),
    ),
    GetPage(
      name: AppRoutes.footballEdit,
      page: () => FootballEditPage(),
      binding: FootballEditBinding(),
    ),
    GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
    GetPage(name: AppRoutes.profile, page: () => ProfilePage()),
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreenPage(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: AppRoutes.loginPage,
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.contactPage,
      page: () => ContactPage(),
      binding: LoginBinding(),
    ),
  ];
}
