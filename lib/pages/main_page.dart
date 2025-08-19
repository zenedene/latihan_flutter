import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan1/controllers/bottom_nav_controller.dart';
import 'package:latihan1/controllers/calculator_controller.dart';
import 'package:latihan1/controllers/football_controller.dart';
import 'package:latihan1/pages/calculator_page.dart';
import 'package:latihan1/pages/football_page.dart';
import 'package:latihan1/pages/profile_page.dart';

class MainPage extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());

  final List<Widget> pages = [CalculatorPage(), FootballPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: navController.currentIndex.value,
          children: pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
          onTap: navController.changePage,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Players",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
